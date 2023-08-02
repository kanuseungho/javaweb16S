package com.spring.javaweb16S;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.spring.javaweb16S.service.DbShopService;
import com.spring.javaweb16S.service.MemberService;
import com.spring.javaweb16S.service.ProductService;
import com.spring.javaweb16S.vo.BannerVO;
import com.spring.javaweb16S.vo.DbBaesongVO;
import com.spring.javaweb16S.vo.DbOptionVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.NoticeVO;

@Controller
@RequestMapping("/dbShop")
public class DbShopController {
	
	@Autowired
	DbShopService dbShopService;
	@Autowired	
	ProductService productService;
	@Autowired
	PageProcess pageProcess;
	@Autowired
	MemberService memberService;	
	@Autowired
	AdminService adminService;

	
	// 대/중/소분류 폼 보기
	@RequestMapping(value = "/dbCategory", method = RequestMethod.GET)
	public String dbCategoryGet(Model model) {
		List<DbProductVO> mainVOS = dbShopService.getCategoryMain();  // 대분류리스트
		List<DbProductVO> middleVOS = dbShopService.getCategoryMiddle();// 중분류리스트
		List<DbProductVO> subVOS = dbShopService.getCategorySub();// 소분류리스트
	
		model.addAttribute("mainVOS", mainVOS);
		model.addAttribute("middleVOS", middleVOS);
		model.addAttribute("subVOS", subVOS);
		
		return "admin/dbShop/dbCategory";
	}
	
	// 대분류 등록하기
	@ResponseBody
	@RequestMapping(value = "/categoryMainInput", method = RequestMethod.POST)
	public String categoryMainInputPost(DbProductVO vo) {
		// 기존에 같은 대분류명이 있는지 체크?
		DbProductVO productVO = dbShopService.getCategoryMainOne(vo.getCategoryMainCode(), vo.getCategoryMainName());
		
		if(productVO != null) return "0";
		dbShopService.setCategoryMainInput(vo);		// 대분류항목 저장
		return "1";
	}
	
	// 대분류 삭제하기
	
	
	// 중분류 등록하기
	@ResponseBody
	@RequestMapping(value = "/categoryMiddleInput", method = RequestMethod.POST)
	public String categoryMiddleInputPost(DbProductVO vo) {
		// 기존에 같은 중분류명이 있는지 체크?
		DbProductVO productVO = dbShopService.getCategoryMiddleOne(vo);
		
		if(productVO != null) return "0";
		dbShopService.setCategoryMiddleInput(vo);		// 중분류항목 저장
		return "1";
	}
	
	// 대분류 선택시 중분류명 가져오기
	@ResponseBody
	@RequestMapping(value = "/categoryMiddleName", method = RequestMethod.POST)
	public List<DbProductVO> categoryMiddleNamePost(String categoryMainCode) {
//		List<DbProductVO> mainVOS = dbShopService.getCategoryMiddleName(categoryMainCode);
//		return mainVOS;
		return dbShopService.getCategoryMiddleName(categoryMainCode);
	}
	
	// 중분류 삭제하기
	
	
  // 소분류 등록하기
	@ResponseBody
	@RequestMapping(value = "/categorySubInput", method = RequestMethod.POST)
	public String categorySubInputPost(DbProductVO vo) {
		// 기존에 같은 소분류명이 있는지 체크?
		DbProductVO productVO = dbShopService.getCategorySubOne(vo);
		
		if(productVO != null) return "0";
		dbShopService.setCategorySubInput(vo);		// 중분류항목 저장
		return "1";
	}
	
	// 소분류 삭제하기
	
	
	// 상품 등록을 위한 등록폼 보여주기
	@RequestMapping(value = "/dbProduct", method = RequestMethod.GET)
	public String dbProducGet(Model model) {
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		return "admin/dbShop/dbProduct";
	}
	
	// 중분류 선택시에 소분류항목들 가져오기
	@ResponseBody
	@RequestMapping(value = "/categorySubName", method = RequestMethod.POST)
	public List<DbProductVO> categorySubNamePost(String categoryMainCode, String categoryMiddleCode) {
		return dbShopService.getCategorySubName(categoryMainCode, categoryMiddleCode);
	}
	
	// 소분류 선택시에 상품명(모델명) 가져오기
	@ResponseBody
	@RequestMapping(value = "/categoryProductName", method = RequestMethod.POST)
	public List<DbProductVO> categoryProductNamePost(String categoryMainCode, String categoryMiddleCode, String categorySubCode) {
	
		return dbShopService.getCategoryProductName(categoryMainCode, categoryMiddleCode, categorySubCode);
	}
	
	// 관리자 상품등록시에 ckeditor에 그림을 올린다면 dbShop폴더에 저장되고, 저장된 파일을 브라우저 textarea상자에 보여준다. 
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUploadGet(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFilename = upload.getOriginalFilename();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFilename = sdf.format(date) + "_" + originalFilename;
		
		byte[] bytes = upload.getBytes();
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/");
		OutputStream outStr = new FileOutputStream(new File(uploadPath + originalFilename));
		outStr.write(bytes);
		
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/dbShop/" + originalFilename;
		out.println("{\"originalFilename\":\""+originalFilename+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		
		out.flush();
		outStr.close();
	}
	
	// 상품 등록을 위한 등록시키기
	@RequestMapping(value = "/dbProduct", method = RequestMethod.POST)
	public String dbProducPost(MultipartFile file, DbProductVO vo) {
		// 이미지파일 업로드시에 ckeditor폴더에서 product폴더로 복사작업처리....(dbShop폴더에서 'dbShop/product'로)
		dbShopService.imgCheckProductInput(file, vo);
		
		return "redirect:/message/dbProductInputOk";
	}
	
	// 등록된 상품 모두 보여주기(관리자화면에서 보여주는 처리부분이다.) - 상품의 소분류명(subTitle)도 함께 출력시켜준다.
	@RequestMapping(value = "/dbShopList", method = RequestMethod.GET)
	public String dbShopListGet(Model model,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part) {
		// 소분류명을 가져온다.
		List<DbProductVO> subTitleVOS = dbShopService.getSubTitle();
		model.addAttribute("subTitleVOS", subTitleVOS);
		model.addAttribute("part", part);
		
		// 전체 상품리스트 가져오기
		List<DbProductVO> productVOS = dbShopService.getDbShopList(part);
		model.addAttribute("productVOS", productVOS);
		
		return "admin/dbShop/dbShopList";
	}
	
	// 관리자에서 진열된 상품을 클릭하였을경우에 해당 상품의 상세내역 보여주기
	@RequestMapping(value="/dbShopContent", method=RequestMethod.GET)
	public String dbShopContentGet(Model model, int idx) {
		DbProductVO productVO = dbShopService.getDbShopProduct(idx);	   // 1건의 상품 정보를 불러온다.
		List<DbOptionVO> optionVos = dbShopService.getDbShopOption(idx); // 해당 상품의 모든 옵션 정보를 가져온다.
		model.addAttribute("productVO", productVO);
		model.addAttribute("optionVos", optionVos);
		model.addAttribute("productIdx", idx);
		
		return "admin/dbShop/dbShopContent";
	}
	@ResponseBody
	@RequestMapping(value="/dbShopDelete", method=RequestMethod.POST)
	public String dbShopDeletePost(
			@RequestParam(name="mainCode", defaultValue = "", required=false) String mainCode
			) {
		dbShopService.setDbShopDelete(mainCode);
		return "1";
	}
	@ResponseBody
	@RequestMapping(value="/dbShopMiddleDelete", method=RequestMethod.POST)
	public String dbShopMiddleDeletePost(
			@RequestParam(name="middleCode", defaultValue = "", required=false) String middleCode
			) {			
		
		dbShopService.setDbShopMiddleDelete(middleCode);
		return "1";
	}
	@ResponseBody
	@RequestMapping(value="/dbShopSubDelete", method=RequestMethod.POST)
	public String dbShopSubDeletePost(
			@RequestParam(name="subCode", defaultValue = "", required=false) String subCode
			) {
		
		dbShopService.setDbShopSubDelete(subCode);
		return "1";
	}
	
	// 옵션 등록창 보여주기(관리자 왼쪽메뉴에서 선택시 처리)
	@RequestMapping(value = "/dbOption", method = RequestMethod.GET)
	public String dbOptionGet(Model model) {
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		model.addAttribute("mainVos", mainVos);
		
		return "admin/dbShop/dbOption";
	}
	
	// 옵션 등록창 보여주기(관리자 상품상세보기에서 호출시 처리)
	@RequestMapping(value = "/dbOption2", method = RequestMethod.GET)
	public String dbOption2Get(Model model, String productName) {
		DbProductVO vo = dbShopService.getProductInfor(productName);
		List<DbOptionVO> optionVos = dbShopService.getOptionList(vo.getIdx());
		model.addAttribute("vo", vo);
		model.addAttribute("optionVos", optionVos);
		
		return "admin/dbShop/dbOption2";
	}
	
	
	// 옵션 등록창에서, 상품을 선택하면 선택된 상품의 상세설명을 가져와서 뿌리기
	@ResponseBody
	@RequestMapping(value="/getProductInfor", method = RequestMethod.POST)
	public DbProductVO getProductInforPost(String productName) {
		return dbShopService.getProductInfor(productName);
	}
	
	// 옵션등록창에서 '옵셔보기'버튼클릭시에 해당 제품의 모든 옵션을 보여주기
	@ResponseBody
	@RequestMapping(value="/getOptionList", method = RequestMethod.POST)
	public List<DbOptionVO> getOptionListPost(int productIdx) {
		return dbShopService.getOptionList(productIdx);
	}
	
	// 옵션 기록사항들을 등록하기
	@RequestMapping(value="/dbOption", method=RequestMethod.POST)
	public String dbOptionPost(Model model, DbOptionVO vo, String[] optionName, int[] optionPrice,
			@RequestParam(name="flag", defaultValue = "", required=false) String flag) {
		for(int i=0; i<optionName.length; i++) {
			
			int optionCnt = dbShopService.getOptionSame(vo.getProductIdx(), optionName[i]);
			if(optionCnt != 0) continue;
			
			// 동일한 옵션이 없으면 vo에 set시킨후 옵션테이블에 등록시킨다.
			vo.setProductIdx(vo.getProductIdx());
			vo.setOptionName(optionName[i]);
			vo.setOptionPrice(optionPrice[i]);
			
			dbShopService.setDbOptionInput(vo);
		}
		if(!flag.equals("option2")) return "redirect:/message/dbOptionInputOk";
		else {
			model.addAttribute("temp", vo.getProductName());
			return "redirect:/message/dbOptionInput2Ok";
		}
	}
	
	// 옵션 등록창에서 옵션리스트를 확인후 필요없는 옵션항목을 삭제처리..
	@ResponseBody
	@RequestMapping(value="/optionDelete", method = RequestMethod.POST)
	public String optionDeletePost(int idx) {
		dbShopService.setOptionDelete(idx);
		return "1";
	}
	
	@RequestMapping(value="/dbShopContent", method = RequestMethod.POST)
	public String dbShopContentPost(int idx, DbProductVO vo) {
		int res = dbShopService.setDbShopContentBrend(idx,vo);
		if(res==1) {
			return "redirect:/message/dbShopContentOk";
		}
		else {
			return "redirect:/message/dbShopContentNo";
		}
	}
	@ResponseBody
	@RequestMapping(value="/dbCartDelete", method=RequestMethod.POST)
	public String dbCartDeleteGet(int idx) {
		dbShopService.dbCartDelete(idx);
		return "";
	}
	
	@RequestMapping(value = "/dbShopNewList",method = RequestMethod.GET)
	public String dbShopNewListGet(
			@RequestParam(name="pag", defaultValue = "1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required=false) int pageSize,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part,
			Model model) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "product", "", "");
		List<DbProductVO> vos = dbShopService.getProductList(pageVO.getStartIndexNo(), pageSize,part);
		List<BannerVO>  bannerVOS = adminService.getImageBanner();
		NoticeVO noticeVO = adminService.getTopBanner();
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("part", part);
		model.addAttribute("bannerVOS", bannerVOS);
		model.addAttribute("noticeVO", noticeVO);
		
		return "dbShop/dbShopNewList";
	}
	@RequestMapping(value = "/dbShopBrendList",method = RequestMethod.GET)
	public String dbShopBrendListtGet(
			@RequestParam(name="pag", defaultValue = "1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required=false) int pageSize,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part,
			Model model) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "product", "", "");
		List<DbProductVO> vos = productService.getProductBrendList(pageVO.getStartIndexNo(), pageSize,part);
		List<BannerVO>  bannerVOS = adminService.getImageBanner();
		NoticeVO noticeVO = adminService.getTopBanner();
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("part", part);
		model.addAttribute("bannerVOS", bannerVOS);			
		model.addAttribute("noticeVO", noticeVO);
		
		return "dbShop/dbShopBrendList";
	}
	@RequestMapping(value = "/dbShopEventList",method = RequestMethod.GET)
	public String dbShopEventListtGet(
			@RequestParam(name="pag", defaultValue = "1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required=false) int pageSize,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part,
			Model model) {
		
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "product", "", "");
		List<DbProductVO> vos = productService.getProductEventList(pageVO.getStartIndexNo(), pageSize,part);
		List<BannerVO>  bannerVOS = adminService.getImageBanner();
		NoticeVO noticeVO = adminService.getTopBanner();
		model.addAttribute("vos",vos);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("part", part);
		model.addAttribute("bannerVOS", bannerVOS);			
		model.addAttribute("noticeVO", noticeVO);
		return "dbShop/dbShopEventList";
	}
	@RequestMapping(value = "/dbShopMagaginList",method = RequestMethod.GET)
	public String dbShopMagaginListGet() {
		
		return "dbShop/dbShopMagaginList";
	}
	@RequestMapping(value = "/dbShopOurletList",method = RequestMethod.GET)
	public String dbShopOurletListGet() {
		
		return "dbShop/dbShopOurletList";
	}
	
	// 현재 로그인 사용자가 주문내역 조회하기 폼 보여주기
	@RequestMapping(value="/dbMyOrder", method=RequestMethod.GET)
	public String dbMyOrderGet(HttpServletRequest request, HttpSession session, Model model,
			String startJumun, 
			String endJumun, 
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize,
  	  @RequestParam(name="conditionOrderStatus", defaultValue="전체", required=false) String conditionOrderStatus) {
		
		String mid = (String) session.getAttribute("sMid");
		int level = (int) session.getAttribute("sLevel");
		if(level == 1) mid = "전체";
		
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "dbMyOrder", mid, "");
		
		// 오늘 구매한 내역을 초기화면에 보여준다.
//		List<DbProductVO> vos = dbShopService.getMyOrderList(pageVO.getStartIndexNo(), pageSize, mid);
		List<DbBaesongVO> vos = dbShopService.getMyOrderList(pageVO.getStartIndexNo(), pageSize, mid);
//		model.addAttribute("vos", vos);
//		model.addAttribute("pageVO",pageVO);
		
		model.addAttribute("vos", vos);				
		model.addAttribute("startJumun", startJumun);
		model.addAttribute("endJumun", endJumun);
		model.addAttribute("conditionOrderStatus", conditionOrderStatus);
		model.addAttribute("pageVO", pageVO);
		
		return "dbShop/dbMyOrder";
	}
	
	// 주문 조건 조회하기(날짜별(오늘/일주일/보름/한달/3개월/전체)
	  @RequestMapping(value="/orderCondition", method=RequestMethod.GET)
	  public String orderConditionGet(HttpSession session, int conditionDate, Model model,
	      @RequestParam(name="pag", defaultValue="1", required=false) int pag,
	      @RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize) {
	    String mid = (String) session.getAttribute("sMid");
	    String strConditionDate = conditionDate + "";
	    PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "dbShopMyOrderCondition", mid, strConditionDate);

	    List<DbBaesongVO> vos = dbShopService.getOrderCondition(mid, conditionDate, pageVO.getStartIndexNo(), pageSize);
	    
			model.addAttribute("vos", vos);
			model.addAttribute("pageVO", pageVO);
	    model.addAttribute("conditionDate", conditionDate);

	    // 아래는 1일/일주일/보름/한달/3달/전체 조회시에 startJumun과 endJumun을 넘겨주는 부분(view에서 시작날짜와 끝날짜를 지정해서 출력시켜주기위해 startJumun과 endJumun값을 구해서 넘겨준다.)
	    Calendar startDateJumun = Calendar.getInstance();
	    Calendar endDateJumun = Calendar.getInstance();
	    startDateJumun.setTime(new Date());  // 오늘날짜로 셋팅
	    endDateJumun.setTime(new Date());    // 오늘날짜로 셋팅
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String startJumun = "";
	    String endJumun = "";
	    switch (conditionDate) {
	      case 1:
	        startJumun = sdf.format(startDateJumun.getTime());
	        endJumun = sdf.format(endDateJumun.getTime());
	        break;
	      case 7:
	        startDateJumun.add(Calendar.DATE, -7);
	        break;
	      case 15:
	        startDateJumun.add(Calendar.DATE, -15);
	        break;
	      case 30:
	        startDateJumun.add(Calendar.MONTH, -1);
	        break;
	      case 90:
	        startDateJumun.add(Calendar.MONTH, -3);
	        break;
	      case 99999:
	        startDateJumun.set(2022, 00, 01);
	        break;
	      default:
	        startJumun = null;
	        endJumun = null;
	    }
	    if(conditionDate != 1 && endJumun != null) {
	      startJumun = sdf.format(startDateJumun.getTime());
	      endJumun = sdf.format(endDateJumun.getTime());
	    }

	    model.addAttribute("startJumun", startJumun);
	    model.addAttribute("endJumun", endJumun);

	    return "dbShop/dbMyOrder";
	  }
	  @RequestMapping(value="/dbOrderBaesong", method=RequestMethod.GET)
		public String dbOrderBaesongGet(String orderIdx, Model model) {
			
			List<DbBaesongVO> vos = dbShopService.getOrderBaesong(orderIdx);  // 같은 주문번호가 2개 이상 있을수 있기에 List객체로 받아온다.
			
			DbBaesongVO vo = vos.get(0);  // 같은 배송지면 0번째것 하나만 vo에 담아서 넘겨주면 된다.
			String payMethod = "";
			if(vo.getPayment().substring(0,1).equals("C")) payMethod = "카드결제";
			else payMethod = "은행(무통장)결제";
			
			model.addAttribute("payMethod", payMethod);
			model.addAttribute("vo", vo);
			
			return "dbShop/dbOrderBaesong";
		}
	  @RequestMapping(value="/test", method=RequestMethod.GET)
	  public String testGet() {
	
		  
		  return "dbShop/test";
	  }
	  
	  
	  @RequestMapping(value="/myOrderStatus", method=RequestMethod.GET)
		public String myOrderStatusGet(
				HttpServletRequest request, 
				HttpSession session, 
				String startJumun, 
				String endJumun, 
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize,
	  	  @RequestParam(name="conditionOrderStatus", defaultValue="전체", required=false) String conditionOrderStatus,
				Model model) {
			String mid = (String) session.getAttribute("sMid");
			int level = (int) session.getAttribute("sLevel");
			
			if(level == 0) mid = "전체";
			String searchString = startJumun + "@" + endJumun + "@" + conditionOrderStatus;
			PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "myOrderStatus", mid, searchString);  // 4번째인자에 '아이디/조건'(을)를 넘겨서 part를 아이디로 검색처리하게 한다.
			
			List<DbBaesongVO> vos = dbShopService.getMyOrderStatus(pageVO.getStartIndexNo(), pageSize, mid, startJumun, endJumun, conditionOrderStatus);
			model.addAttribute("vos", vos);				
			model.addAttribute("startJumun", startJumun);
			model.addAttribute("endJumun", endJumun);
			model.addAttribute("conditionOrderStatus", conditionOrderStatus);
			model.addAttribute("pageVO", pageVO);
			
			return "dbShop/dbMyOrder";
		}
		
}
