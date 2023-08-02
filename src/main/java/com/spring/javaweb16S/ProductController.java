package com.spring.javaweb16S;

import java.util.List;

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
import com.spring.javaweb16S.service.ProductService;
import com.spring.javaweb16S.vo.BannerVO;
import com.spring.javaweb16S.vo.DbCartVO;
import com.spring.javaweb16S.vo.DbOptionVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.IntairastoryVO;
import com.spring.javaweb16S.vo.NoticeVO;
import com.spring.javaweb16S.vo.ReviewVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired	
	ProductService productService;
	@Autowired
	PageProcess pageProcess;
	@Autowired
	MemberService memberService;	
	@Autowired
	AdminService adminService;
	@RequestMapping(value = "/tableWere/dish",method = RequestMethod.GET)
	public String dishGet(
			@RequestParam(name="pag", defaultValue = "1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "9", required=false) int pageSize,
			@RequestParam(name="part", defaultValue = "접시", required = false) String part,
			Model model) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, part, "", "");
		List<DbProductVO> vos = productService.getProductList(pageVO.getStartIndexNo(), pageSize, part);
		List<BannerVO>  bannerVOS = adminService.getImageBanner();
		NoticeVO noticeVO = adminService.getTopBanner();		
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("part", part);
		model.addAttribute("bannerVOS", bannerVOS);
		model.addAttribute("noticeVO", noticeVO);
		return "product/tableWere/dish";
	}
	
  // 진열된 상품클릭시 해당상품의 상세정보 보여주기(사용자(고객)화면에서 보여주기)
	@RequestMapping(value="/tableWere/dishContent", method=RequestMethod.GET)
	public String dishContentGet(int idx, Model model) {		
		DbProductVO productVO = productService.getDbShopProduct(idx);			// 상품의 상세정보 불러오기		
		List<DbOptionVO> optionVOS = productService.getDbShopOptionShow(idx);	// 옵션의 모든 정보 불러오기
		List<ReviewVO> reviewVOS = productService.getProductReviewList(idx);	// 리뷰 가져오기
		
		NoticeVO noticeVO = adminService.getTopBanner();
		model.addAttribute("productVO", productVO);
		model.addAttribute("reviewVOS", reviewVOS);
		model.addAttribute("optionVOS", optionVOS);
		model.addAttribute("noticeVO", noticeVO);
		return "product/tableWere/dishContent";
	}
	
	@RequestMapping(value="/productDetailed", method=RequestMethod.GET)
	public String productDetailedGet(int idx, Model model) {		
		DbProductVO productVO = productService.getDbShopProduct(idx);			// 상품의 상세정보 불러오기		
		List<DbOptionVO> optionVOS = productService.getDbShopOptionShow(idx);	// 옵션의 모든 정보 불러오기
		List<ReviewVO> reviewVOS = productService.getProductReviewList(idx);	// 리뷰 가져오기
		
		NoticeVO noticeVO = adminService.getTopBanner();
		model.addAttribute("productVO", productVO);
		model.addAttribute("reviewVOS", reviewVOS);
		model.addAttribute("optionVOS", optionVOS);
		model.addAttribute("noticeVO", noticeVO);
		return "product/productDetailed";
	}
	
	@RequestMapping(value="/productDetailed", method=RequestMethod.POST)
	public String productDetailedPost(int idx, Model model,DbCartVO vo, HttpSession session, String flag) {
		
		DbProductVO productVO = productService.getDbShopProduct(idx);			// 상품의 상세정보 불러오기		
		List<DbOptionVO> optionVOS = productService.getDbShopOptionShow(idx);	// 옵션의 모든 정보 불러오기
		model.addAttribute("productVO", productVO);
		model.addAttribute("optionVOS", optionVOS);
	
		String mid = (String) session.getAttribute("sMid");
		DbCartVO resVo = productService.getDbCartProductOptionSearch(vo.getProductName(), vo.getOptionName(), mid);
		
		if(resVo != null) {		// 기존에 구매한적이 있었다면 '현재 구매한 내역'과 '기존 장바구니의 수량'을 합쳐서 'Update'시켜줘야한다.
			String[] voOptionNums = vo.getOptionNum().split(",");
			String[] resOptionNums = resVo.getOptionNum().split(",");
			int[] nums = new int[99];
			String strNums = "";
			for(int i=0; i<voOptionNums.length; i++) {
				nums[i] += (Integer.parseInt(voOptionNums[i]) + Integer.parseInt(resOptionNums[i]));
				strNums += nums[i];
				if(i < nums.length - 1) strNums += ",";
			}
			vo.setOptionNum(strNums);
			productService.dbShopCartUpdate(vo);
		}		// 처음 구매하는 제품이라면 장바구니에 insert시켜준다.
		else {
			productService.dbShopCartInput(vo);
		}
		
		if(flag.equals("order")) {
			return "product/tableWere/dishContent";
		}
		else {
			return "product/tableWere/dishContent";
		}		
	
	}
	
	@RequestMapping(value="/tableWere/dishContent", method=RequestMethod.POST)
	public String dishContentPost(int idx, Model model,DbCartVO vo, HttpSession session, String flag ) {
		DbProductVO productVO = productService.getDbShopProduct(idx);			// 상품의 상세정보 불러오기		
		List<DbOptionVO> optionVOS = productService.getDbShopOptionShow(idx);	// 옵션의 모든 정보 불러오기
		model.addAttribute("productVO", productVO);
		model.addAttribute("optionVOS", optionVOS);
		
		String mid = (String) session.getAttribute("sMid");
		DbCartVO resVo = productService.getDbCartProductOptionSearch(vo.getProductName(), vo.getOptionName(), mid);
		
		if(resVo != null) {		// 기존에 구매한적이 있었다면 '현재 구매한 내역'과 '기존 장바구니의 수량'을 합쳐서 'Update'시켜줘야한다.
			String[] voOptionNums = vo.getOptionNum().split(",");
			String[] resOptionNums = resVo.getOptionNum().split(",");
			int[] nums = new int[99];
			String strNums = "";
			for(int i=0; i<voOptionNums.length; i++) {
				nums[i] += (Integer.parseInt(voOptionNums[i]) + Integer.parseInt(resOptionNums[i]));
				strNums += nums[i];
				if(i < nums.length - 1) strNums += ",";
			}
			if (strNums.endsWith(",")) {
			    strNums = strNums.substring(0, strNums.length() - 1); // 마지막 문자(쉼표)를 제거
			}
			vo.setOptionNum(strNums);

			
			productService.dbShopCartUpdate(vo);
			/*
			if(vo.getOptionNum() != null) {
				productService.setBrendRepice(vo);
				
				BrendVO brendVO = productService.getBrendrecipe(vo);
				
				int num =  Integer.parseInt( brendVO.getRecipe());
				if(num==0) {
					productService.setProductStusUpdate(vo.getProductIdx());
				}
			}
			
			*/
			
			
			
		}		// 처음 구매하는 제품이라면 장바구니에 insert시켜준다.
		else {
			productService.dbShopCartInput(vo);
		}
		
		if(flag.equals("order")) {
			return "product/tableWere/dishContent";
		}
		else {
			return "product/tableWere/dishContent";
		}		
	
	}
	
	@RequestMapping(value = "/productItemSearch",method = RequestMethod.POST)
	public String productItemSearchGet(String itemSearch, Model model) {
		List<DbProductVO> productVOS = productService.getProductItemSearch(itemSearch);
		List<BannerVO>  bannerVOS = adminService.getImageBanner();
		model.addAttribute("bannerVOS",bannerVOS);
		model.addAttribute("productVOS",productVOS);
		return "product/productItemSearchOk";
	}
	@ResponseBody
	@RequestMapping(value = "/productDelete",method = RequestMethod.POST)
	public String productDeletePost(@RequestParam(value = "checkRows[]") String[] checkRows) {
		int res = 0;
		for(String item : checkRows) {
			res = productService.setProductDelete(item);
		}		

	    if (res==1) {
	        return "1";
	    } else {
	        return "0";
	    }    
	}

	@ResponseBody
    @RequestMapping(value = "/productlikeGood", method = RequestMethod.POST)
    public int recipeDibsPost(@RequestParam(name="idx", defaultValue = "0", required=false) int idx,  HttpSession session) {
      // 아이디 세션 가져오기
      String mid = (String) session.getAttribute("sMid");
      
      // 선택한 레시피를 아이디와 함께 저장(레시피 찜하기 처리)
      boolean dibs = productService.toggleDibsRecipe(idx, mid);
      
      // 반환할 값 설정
      int res = dibs ? 1: 0;
      if(dibs) res = 1;
      else res = 0;
      
      return res;
    }
	@RequestMapping(value = "/disinstory", method = RequestMethod.GET)
	public String disinstoryGet(Model model) {
		List<IntairastoryVO> intaVOS = productService.getIntairastoryList();
		model.addAttribute("intaVOS",intaVOS);
		return "product/disinstory";
	}
	@RequestMapping(value = "/intairastory", method = RequestMethod.GET)
	public String intairastoryGet(Model model) {
		List<IntairastoryVO> intaVOS = productService.getIntairastoryList();
		model.addAttribute("intaVOS",intaVOS);
		return "product/intairastory";
	}
	@RequestMapping(value = "/intairastory", method = RequestMethod.POST)
	public String intairastoryPost(MultipartFile fSNAme, String posiction) {
		int qwe = productService.getIntairastoryPosiction(posiction);
		if(qwe ==1) {
			int res = productService.setUpdateIntairaStory(fSNAme,posiction);
			if(res == 1) {
				return "redirect:/message/setIntairaStoryOk";
			}
			else {
				return "redirect:/message/setIntairaStoryNo";
			}
		}
		else {
			int res = productService.setIntairaStory(fSNAme,posiction);
			if(res == 1) {
				return "redirect:/message/setIntairaStoryOk";
			}
			else {
				return "redirect:/message/setIntairaStoryNo";
			}
		}
		

	}
	@RequestMapping(value = "/shoppingstory", method = RequestMethod.GET)
	public String shoppingstoryGet() {
		
		return "product/shoppingstory";
	}
	@RequestMapping(value = "/inspirationTips", method = RequestMethod.GET)
	public String inspirationTipsGet() {
		
		return "product/inspirationTips";
	}
	@RequestMapping(value = "/outTip", method = RequestMethod.GET)
	public String outTipGet() {
		
		return "product/outTip";
	}
}
