package com.spring.javaweb16S;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.pagination.PageProcess;
import com.spring.javaweb16S.pagination.PageVO;
import com.spring.javaweb16S.service.AdminService;
import com.spring.javaweb16S.service.MemberService;
import com.spring.javaweb16S.service.MyPageService;
import com.spring.javaweb16S.service.ProductService;
import com.spring.javaweb16S.vo.CuponVO;
import com.spring.javaweb16S.vo.DbBaesongVO;
import com.spring.javaweb16S.vo.DbCartVO;
import com.spring.javaweb16S.vo.DbOrderVO;
import com.spring.javaweb16S.vo.DbPayMentVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.MemberVO;
import com.spring.javaweb16S.vo.ReturnsVO;
import com.spring.javaweb16S.vo.ReviewVO;
import com.theokanning.openai.completion.chat.ChatCompletionChunk;
import com.theokanning.openai.completion.chat.ChatCompletionRequest;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.completion.chat.ChatMessageRole;
import com.theokanning.openai.service.OpenAiService;

import io.reactivex.Flowable;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	MyPageService myPageService;

	@Autowired
	MemberService memberService;

	@Autowired
	ProductService productService;

	@Autowired
	PageProcess pageProcess;

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/memberPage", method = RequestMethod.GET)
	public String memberPageGet() {

		return "myPage/memberPage";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profileGet(MemberVO vo, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		vo = memberService.getMemberInfo(mid);
		if (vo != null) {
			model.addAttribute("vo", vo);
			return "myPage/profile";
		} else {
			return "member/memberMain";
		}
	}

	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String profilePost(MultipartFile fName, MemberVO vo,
			@RequestParam(name = "idx", defaultValue = "1", required = false) int idx) {
		int res = memberService.memberUpdate(fName, vo, idx);
		if (res == 1) {
			return "redirect:/message/memberUpdateOk";
		} else {
			return "redirect:/message/memberUpdateNo";
		}

	}

	@RequestMapping(value = "/secession", method = RequestMethod.GET)
	public String profileGet() {

		return "myPage/secession";
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.GET)
	public String memberDeleteGet(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		int res = memberService.setMemberDelete(mid);
		if (res == 1) {
			session.invalidate();
			return "redirect:/message/memberDeleteOk";
		} else {
			return "redirect:/message/memberDeleteNo";
		}
	}

	@RequestMapping(value = "/myCart", method = RequestMethod.GET)
	public String myCartGet(HttpSession session, DbCartVO vo, Model model) {
		String mid = (String) session.getAttribute("sMid");
		List<DbCartVO> vos = productService.getDbCartList(mid);
		if (vos.size() == 0) {
			return "redirect:/message/cartEmpty";
		}

		model.addAttribute("cartListVOS", vos);
		return "myPage/myCart";

	}

	@RequestMapping(value = "myCart", method = RequestMethod.POST)
	public String myCartPost(HttpServletRequest request, Model model, HttpSession session,
			@RequestParam(name = "baesong", defaultValue = "0", required = false) int baesong) {
		String mid = session.getAttribute("sMid").toString();

		// 주문한 상품에 대하여 '고유번호'를 만들어준다.
		// 고유주문번호(idx) = 기존에 존재하는 주문테이블의 고유번호 + 1
		DbOrderVO maxIdx = productService.getOrderMaxIdx();
		int idx = 1;
		if (maxIdx != null)
			idx = maxIdx.getMaxIdx() + 1;

		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String orderIdx = sdf.format(today) + idx;

		// 장바구니에서 구매를 위해 선택한 모든 항목들은 배열로 넘어온다.
		String[] idxChecked = request.getParameterValues("idxChecked");

		DbCartVO cartVo = new DbCartVO();
		List<DbOrderVO> orderVOS = new ArrayList<DbOrderVO>();

		for (String strIdx : idxChecked) {
			cartVo = productService.getCartIdx(Integer.parseInt(strIdx));
			DbOrderVO orderVo = new DbOrderVO();
			orderVo.setProductIdx(cartVo.getProductIdx());
			orderVo.setProductName(cartVo.getProductName());
			orderVo.setMainPrice(cartVo.getMainPrice());
			orderVo.setThumbImg(cartVo.getThumbImg());
			orderVo.setOptionName(cartVo.getOptionName());
			orderVo.setOptionPrice(cartVo.getOptionPrice());
			orderVo.setOptionNum(cartVo.getOptionNum());
			orderVo.setTotalPrice(cartVo.getTotalPrice());
			orderVo.setCartIdx(cartVo.getIdx());
			orderVo.setBaesong(baesong);

			orderVo.setOrderIdx(orderIdx); // 관리자가 만들어준 '주문고유번호'를 저장
			orderVo.setMid(mid); // 로그인한 아이디를 저장한다.

			orderVOS.add(orderVo);
		}
		session.setAttribute("sOrderVOS", orderVOS);
		
		
		// 배송처리를 위한 현재 로그인한 아이디에 해당하는 고객의 정보를 member2테이블에서 가져온다.
		MemberVO memberVO = memberService.getMemberIdCheck(mid);
		model.addAttribute("memberVO", memberVO);
		return "myPage/dbOrder";
	}

	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String paymentPost(DbOrderVO orderVo, DbPayMentVO payMentVO, DbBaesongVO baesongVO, HttpSession session, String couponAmount,String pointAmount,
			Model model ) {
		String membership = "";
		String mid = (String) session.getAttribute("sMid");
		if (baesongVO.getOrderTotalPrice() <= 50000) {
		    baesongVO.setOrderTotalPrice(baesongVO.getOrderTotalPrice() + 3000);		    
		} 
		if(pointAmount != null && pointAmount != "") {
			int resPoint = Integer.parseInt(pointAmount);
			if(resPoint <= baesongVO.getOrderTotalPrice()) {
				baesongVO.setOrderTotalPrice(baesongVO.getOrderTotalPrice() - resPoint);
				membership = "point";
				memberService.setMemberPointUS(mid,resPoint);
				baesongVO.setMembership(membership);
				baesongVO.setMembershipPrice(resPoint);
			} 
			else {
				resPoint = baesongVO.getOrderTotalPrice();
		        baesongVO.setOrderTotalPrice(0);
		    }
			
		}
		if(couponAmount != null && couponAmount != "" ) {
			int cpa = Integer.parseInt(couponAmount);			
			if (cpa <= baesongVO.getOrderTotalPrice()) {
				baesongVO.setOrderTotalPrice(baesongVO.getOrderTotalPrice() - cpa);
				membership ="coupon";
				baesongVO.setMembership(membership);
				baesongVO.setMembershipPrice(cpa);
		    } 
			else {
				cpa = baesongVO.getOrderTotalPrice();
		        baesongVO.setOrderTotalPrice(0);
		    }
			
		}
		
		//baesongVO
		model.addAttribute("payMentVO", payMentVO);
		session.setAttribute("sPayMentVO", payMentVO);
		session.setAttribute("sBaesongVO", baesongVO);
		return "myPage/paymentOk";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/paymentResult", method = RequestMethod.GET)
	public String paymentResultGet(HttpSession session, DbPayMentVO receivePayMentVO, Model model) {
		// 주문내역 dbOrder/dbBaesong 테이블에 저장하기(앞에서 저장했던 세션에서 가져왔다.)
		List<DbOrderVO> orderVOS = (List<DbOrderVO>) session.getAttribute("sOrderVOS");
		DbPayMentVO payMentVO = (DbPayMentVO) session.getAttribute("sPayMentVO");
		DbBaesongVO baesongVO = (DbBaesongVO) session.getAttribute("sBaesongVO");
//		사용된 세션은 반환한다.
		
		productService.setUpdateProductStock(orderVOS);
		
		session.removeAttribute("sBaesongVO");
		
		for (DbOrderVO vo : orderVOS) {
			vo.setIdx(Integer.parseInt(vo.getOrderIdx().substring(8))); // 주문테이블에 고유번호를 셋팅한다.
			vo.setOrderIdx(vo.getOrderIdx()); // 주문번호를 주문테이블의 주문번호필드에 지정처리한다.
			vo.setMid(vo.getMid());

			productService.setDbOrder(vo); // 주문내용을 주문테이블(dbOrder)에 저장.
			productService.setDbCartDeleteAll(vo.getCartIdx()); // 주문이 완료되었기에 장바구니(dbCart)테이블에서 주문한 내역을 삭체처리한다.

		}
		// 주문된 정보를 배송테이블에 담기위한 처리(기존 baesongVO에 담기지 않은 내역들을 담아주고 있다.)
		baesongVO.setOidx(orderVOS.get(0).getIdx());
		baesongVO.setBaesongImg(orderVOS.get(0).getThumbImg());
		baesongVO.setOrderIdx(orderVOS.get(0).getOrderIdx());
		baesongVO.setAddress(payMentVO.getBuyer_addr());
		baesongVO.setTel(payMentVO.getBuyer_tel());

		productService.setDbBaesong(baesongVO); // 배송내용을 배송테이블(dbBaesong)에 저장
		productService.setMemberPointPlus((int) (baesongVO.getOrderTotalPrice() * 0.1), orderVOS.get(0).getMid()); // 회원테이블에
																													// 포인트
																													// 적립하기(1%)

		payMentVO.setImp_uid(receivePayMentVO.getImp_uid());
		payMentVO.setMerchant_uid(receivePayMentVO.getMerchant_uid());
		payMentVO.setPaid_amount(receivePayMentVO.getPaid_amount());
		payMentVO.setApply_num(receivePayMentVO.getApply_num());

		// 오늘 주문에 들어간 정보들을 확인해주기위해 다시 session에 담아서 넘겨주고 있다.
		session.setAttribute("sPayMentVO", payMentVO);
		session.setAttribute("orderTotalPrice", baesongVO.getOrderTotalPrice());
		String mid = (String) session.getAttribute("sMid");
		String coupon = (String) session.getAttribute("sCouponUS");
		
		myPageService.setMemberCouponStuUpdate(mid,coupon);
		return "redirect:/message/paymentResultOk";
	}

	
	@RequestMapping(value = "/paymentResultOk", method = RequestMethod.GET)
	private String paymentResultOkGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		if (mid == null) {
			return "redirect:/message/myPageLogin";
		}
		List<CuponVO> cuponVOS = productService.getCuponList();
		session.setAttribute("sCuponVOS", cuponVOS);
		MemberVO memberVO = memberService.getMemberIdCheck(mid);
		List<DbBaesongVO> baesongVOS = productService.getBaesongList(mid);
		model.addAttribute("baesongVOS", baesongVOS);
		model.addAttribute("memberVO", memberVO);
		return "myPage/paymentResultOk";
	}

	@RequestMapping(value = "/deliveryUpdate", method = RequestMethod.GET)

	public String deliveryUpdateGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		List<DbBaesongVO> baesongVOS = productService.getDeliveryUpdate(mid);
		model.addAttribute("baesongVOS", baesongVOS);
		return "myPage/deliveryUpdate";
	}

	@RequestMapping(value = "/deliveryUpdateMember", method = RequestMethod.POST)
	public String deliveryUpdateMemberPost(DbBaesongVO vo, HttpSession session, Model model) {
		int res = productService.setDeliveryUpdateMember(vo);
		if (res == 1) {
			String mid = (String) session.getAttribute("sMid");
			List<DbBaesongVO> baesongVOS = productService.getDeliveryUpdate(mid);
			model.addAttribute("baesongVOS", baesongVOS);
			return "myPage/deliveryUpdate";
		} else {
			return "redirect:/message/deliveryUpdateMemberNo";
		}

	}

	@RequestMapping(value = "/deliveryUpdateAddress", method = RequestMethod.POST)
	public String deliveryUpdateAddressPost(String postcode, String roadAddress, String detailAddress,
			String extraAddress, HttpSession session, Model model, int idx) {
		String address = postcode + roadAddress + detailAddress + extraAddress;
		int res = productService.setDeliveryUpdateAddress(address, idx);
		if (res == 1) {
			String mid = (String) session.getAttribute("sMid");
			List<DbBaesongVO> baesongVOS = productService.getDeliveryUpdate(mid);
			model.addAttribute("baesongVOS", baesongVOS);
			return "myPage/deliveryUpdate";
		} else {
			return "redirect:/message/deliveryUpdateMemberNo";
		}

	}

	@RequestMapping(value = "/memberInquire", method = RequestMethod.GET)
	public String memberInquireGet() {
		return "myPage/memberInquire";
	}

	@RequestMapping(value = "/customer/memberInquire2", method = RequestMethod.GET)
	public String memberInquire2Get() {
		return "myPage/customer/memberInquire2";
	}

	@RequestMapping(value = "/customer/contactopeninghours", method = RequestMethod.GET)
	public String contactopeninghoursGet() {
		return "myPage/customer/contactopeninghours";
	}

	@RequestMapping(value = "/customer/tracktrace", method = RequestMethod.GET)
	public String tracktraceGet() {
		return "myPage/customer/tracktrace";
	}

	@RequestMapping(value = "/customer/shippinginformation", method = RequestMethod.GET)
	public String shippinginformationGet() {
		return "myPage/customer/shippinginformation";
	}

	@RequestMapping(value = "/customer/returnpolicy", method = RequestMethod.GET)
	public String returnpolicyGet() {
		return "myPage/customer/returnpolicy";
	}

	@RequestMapping(value = "/customer/returns", method = RequestMethod.GET)
	public String returnsGet() {
		return "myPage/customer/returns";
	}

	@RequestMapping(value = "/customer/termsconditions", method = RequestMethod.GET)
	public String termsconditionsGet() {
		return "myPage/customer/termsconditions";
	}

	@RequestMapping(value = "/customer/privacypolicy", method = RequestMethod.GET)
	public String privacypolicyGet() {
		return "myPage/customer/privacypolicy";
	}

	@RequestMapping(value = "/customer/cookies", method = RequestMethod.GET)
	public String cookiesGet() {
		return "myPage/customer/cookies";
	}

	@RequestMapping(value = "/customer/faq", method = RequestMethod.GET)
	public String faqGet() {
		return "myPage/customer/faq";
	}

	@RequestMapping(value = "/customer/returns", method = RequestMethod.POST)
	public String returnsPost(ReturnsVO vo, HttpSession session) {
		int res = productService.setCustomerReturns(vo);
		if (res == 1) {
			session.setAttribute("sProductCode", vo.getProductCode());
			return "myPage/customer/returnsOk";
		} else {
			return "redirect:/message/customerReturnsNo";
		}

	}

	@RequestMapping(value = "/adminReturnReport", method = RequestMethod.POST)
	public String adminReturnReportPost(ReturnsVO vo, MultipartFile photo) {
		int res = productService.setAdminReturnReport(photo, vo);

		if (res == 1)
			return "redirect:/message/adminReturnReportOk";
		else
			return "redirect:/message/adminReturnReportNo";
	}

	@RequestMapping(value = "/chatGtp", method = RequestMethod.GET)
	public String chatGtpGet() {

		return "myPage/chatGtp";
	}

	@ResponseBody
	@RequestMapping(value = "/chatGtp", method = RequestMethod.POST)
	public String chatGtpPost(String value, HttpSession session) {
		String token = "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";
		OpenAiService service = new OpenAiService(token);

		List<ChatMessage> messages = new ArrayList<>();
		ChatMessage systemMessage = new ChatMessage(ChatMessageRole.USER.value(), value);
		messages.add(systemMessage);
		ChatCompletionRequest chatCompletionRequest = ChatCompletionRequest.builder().model("gpt-3.5-turbo")
				.messages(messages).n(1).maxTokens(50).logitBias(new HashMap<>()).build();
		Flowable<ChatCompletionChunk> flowableResult = service.streamChatCompletion(chatCompletionRequest);
		StringBuilder buffer = new StringBuilder();

		flowableResult.subscribe(chunk -> {
			chunk.getChoices().forEach(choice -> {
				String result = choice.getMessage().getContent();
				if (result != null) {
					buffer.append(result);
					System.out.print(choice.getMessage().getContent());
				}
			});
		}, Throwable::printStackTrace, () -> {
			System.out.println();
			// 모델은 안되는듯 model.addAttribute("chatResult", buffer.toString()); // 결과 값을 Model에
			// 저장
			session.setAttribute("sChatResult", buffer.toString());
			System.out.println("buffer.toString()" + buffer.toString());
		});

		service.shutdownExecutor();

		return "";
	}

	@RequestMapping(value = "/loveInProduct", method = RequestMethod.GET)
	public String loveInProductGet(@RequestParam(name = "pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name = "pageSize", defaultValue = "5", required = false) int pageSize,
			@RequestParam(name = "part", defaultValue = "전체", required = false) String part, Model model,
			HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "product", "", "");
		List<DbProductVO> vos = productService.getLoveProductList(pageVO.getStartIndexNo(), pageSize, part, mid);
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("part", part);
		return "myPage/loveInProduct";
	}

	@RequestMapping(value = "/myClaim", method = RequestMethod.GET)
	public String myClaimGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		List<ReturnsVO> returnVOS = productService.getMyClaimList(mid);
		model.addAttribute("returnVOS", returnVOS);

		return "myPage/myClaim";
	}

	@ResponseBody
	@RequestMapping(value = "/claimUpdate", method = RequestMethod.POST)
	public String claimUpdatePost(String value, int idx) {
		myPageService.memberClaimUpdate(value, idx);
		return "1";
	}
	@ResponseBody
	@RequestMapping(value = "/couponGetUpdate", method = RequestMethod.POST)
	public String couponGetUpdatePost(String code, HttpSession session , int idx) {
		String str= "";
		String mid = (String) session.getAttribute("sMid");
		//쿠폰을 발급 받은 적이 있나 없나 찾음
		CuponVO cuponVO =adminService.getCouponMemberSerch(code,mid);		
		//쿠폰이 발급 받은 적이 없다면 insert를 시켜서 발급을 시켜줌
		if(cuponVO == null) {
			//다시 쿠폰의 정보를 가져와야하기 떄문에 select로 모든 idx에 해당하는 것을 가져올 거임 
			CuponVO cuponInsertVO =adminService.getCouponMemberInsertSerch(idx);		
			// 가져온 정보를 mid와 함께 넘겨서 insert를 시켜줄 것임 그럼 다음에 다시 발급을 했을 때 값이 있는 걸로 나오기 떄문에 발급을 받을 수 없음
			adminService.setCouponMember(cuponInsertVO,mid);
			str="1";
		}
		else {
			str="0";
		}
		
		return str;
	}

	
	@ResponseBody
	@RequestMapping(value = "/couponasUS", method = RequestMethod.POST)
	public String couponasUSPost(HttpSession session, String couponUS) {
	    String couponAmount = ""; // couponAmount 값을 저장할 변수
	    session.setAttribute("sCouponUS", couponUS);
	    String mid = (String) session.getAttribute("sMid");
	    CuponVO cuponVO = adminService.getCouponMemberSerch(couponUS, mid);
	    if (cuponVO != null) {
	        couponAmount = cuponVO.getCouponAmount(); // couponAmount 값을 변수에 저장
	        // 쿠폰이 있을 경우 처리
	    } else {
	        // 쿠폰이 없을 경우 처리
	    	couponAmount = "";
	    }
	    
	    return couponAmount; // couponAmount 값을 반환하여 AJAX 요청의 응답으로 전달
	}
	
	    
	@RequestMapping(value = "/byProductReview", method = RequestMethod.GET)
	public String byProductReviewGet(HttpSession session, Model model) {
		
		String mid = (String) session.getAttribute("sMid");
		if (mid == null) {
			return "redirect:/message/myPageLogin";
		}
		MemberVO memberVO = memberService.getMemberIdCheck(mid);
		List<DbBaesongVO> baesongVOS = productService.getBaesongList(mid);
		model.addAttribute("baesongVOS", baesongVOS);
		model.addAttribute("memberVO", memberVO);
		return "myPage/byProductReview";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String reviewGet(HttpSession session, Model model, int idx) {		
		String mid = (String) session.getAttribute("sMid");
		if (mid == null) {
			return "redirect:/message/myPageLogin";
		}
		MemberVO memberVO = memberService.getMemberIdCheck(mid);		
		DbBaesongVO baesongVO = productService.getReviewSerchProduct(idx,mid);
		model.addAttribute("baesongVO", baesongVO);
		model.addAttribute("memberVO", memberVO);
		return "myPage/review";
	}
	@RequestMapping(value = "/reviewSub",method = RequestMethod.POST)
	public String reviewSubPost(MultipartFile reviewPhoNatome, ReviewVO reviewVO) {
		System.out.println(reviewVO+" : reviewVO");
		int res = myPageService.setReviewSub(reviewPhoNatome,reviewVO);
		if(res==1) {
			return "redirect:/message/reviewSubOK";
		}
		else {
			return "redirect:/message/reviewSubNO?idx="+reviewVO.getIdx();
		}
		
	}
}
