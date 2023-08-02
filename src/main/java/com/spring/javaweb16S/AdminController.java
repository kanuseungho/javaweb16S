package com.spring.javaweb16S;

import java.beans.Transient;
import java.util.List;

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
import com.spring.javaweb16S.vo.CuponVO;
import com.spring.javaweb16S.vo.DbBaesongVO;
import com.spring.javaweb16S.vo.DbOptionVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.MemberVO;
import com.spring.javaweb16S.vo.ReturnsVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	@Autowired
	PageProcess pageProcess;
	@Autowired
	DbShopService dbShopService;
	@Autowired
	ProductService productService; 
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "/adminLeft", method = RequestMethod.GET)
	public String adminLeft() {
		return "admin/adminLeft";
	}
	
	@RequestMapping(value = "/adminContent", method = RequestMethod.GET)
	public String adminContent() {
		return "admin/adminContent";
	}
	@RequestMapping(value = "/adminMemberList", method = RequestMethod.GET)
	public String adminMemberListGet(
			@RequestParam(name="mid", defaultValue = "", required = false) String mid,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "member", "", mid);
		List<MemberVO> memberVos = memberService.getAdminMemberList(pageVO.getStartIndexNo(), pageSize, mid);
		model.addAttribute("memberVos",memberVos);		
		model.addAttribute("pageVO", pageVO);		
		model.addAttribute("mid", mid);
		
		return "admin/adminMemberList";
	}
	@RequestMapping(value = "/adminBannerPhoto", method = RequestMethod.GET)
	public String adminBannerPhotoGet(Model model,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part
			) {
		List<DbProductVO> productVOS = dbShopService.getDbShopList(part);
		model.addAttribute("productVOS", productVOS);
		
		return "admin/adminBannerPhoto";
	}

	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public String uploadImageGet(MultipartFile file, BannerVO vo) {
		int res =0;		
		BannerVO zom = adminService.getUploadCheck(vo);
		if(zom!=null) {
			res = adminService.setUploadImageUpdateOk(file,vo);
			if(res==1) {
				return "redirect:/message/uploadImageUpdateOk";
			}
			else {
				return "redirect:/message/uploadImageUpdateNo";
			}
		}
		else {
			res = adminService.setUploadImageOk(file,vo);
			if(res==1) {
				return "redirect:/message/uploadImageOk";
			}
			else {
				return "redirect:/message/uploadImageNo";
			}		  
		}
		
	}
	@RequestMapping(value = "/adminMainBannerTop", method = RequestMethod.POST)
	public String adminMainBannerTopGet(String topBanner) {
		int res = adminService.setAdminMainBannerTopInput(topBanner);
		if(res==1) {
			return "redirect:/message/adminMainBannerTopOk";		
		}
		else {
			return "redirect:/message/adminMainBannerTopNo";
		}
	}
	
	
	@RequestMapping(value="/dbShop/dbShopRedefinedUpdate", method = RequestMethod.GET)
	public String dbShopRedefinedUpdateGet(int idx , Model model) {		
		DbProductVO productVO = productService.getDbShopProduct(idx);			// 상품의 상세정보 불러오기		
		List<DbOptionVO> optionVOS = productService.getDbShopOptionShow(idx);	// 옵션의 모든 정보 불러오기
		model.addAttribute("productVO", productVO);
		model.addAttribute("optionVOS", optionVOS);
		
		return "admin/dbShop/dbShopRedefinedUpdate";
	}
	@RequestMapping(value="/adminProductMainimageUpdate", method = RequestMethod.POST)
	public String adminProductMainimageUpdatePost(int idx,MultipartFile fileInput) {		
		 int res = productService.setAdminProductMainimageUpdate(idx,fileInput);
		 if(res==1) {
			 return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
		 }
		 else {
			 return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
		 }
	}
	@RequestMapping(value="/adminProductNameUpdate", method = RequestMethod.POST)
	public String adminProductNameUpdatePost(int idx, String productNameUpdate) {
		int res = productService.setAdminProductNameUpdate(idx, productNameUpdate);
		if(res==1) {
			 return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
		 }
		 else {
			 return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
		 }
		
		}
	@RequestMapping(value="/adminDetailUpdate", method = RequestMethod.POST)
	public String adminDetailUpdatePost(int idx, String productDetailUpdate) {
		int res = productService.setAdminDetailUpdate(idx, productDetailUpdate);
		if(res==1) {
			return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
		}
		else {
			return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
		}
		
	}
	@RequestMapping(value="/adminSalePriceUpdate", method = RequestMethod.POST)
	public String adminSalePriceUpdatePost(int idx, String salePriceUpdate) {
		int res = productService.setAdminSalePriceUpdate(idx, salePriceUpdate);
		if(res==1) {
			return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
		}
		else {
			return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
		}
		
	}
	@RequestMapping(value="/adminMainPriceUpdate", method = RequestMethod.POST)
	public String adminMainPriceUpdatePost(int idx, String mainPriceUpdate) {
		int res = productService.setAdminMainPriceUpdate(idx, mainPriceUpdate);
		if(res==1) {
			return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
		}
		else {
			return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
		}
		
	}
	@RequestMapping(value="/adminProductDelUpdate", method = RequestMethod.POST)
	public String adminProductDelUpdatePost(int idx, String productDelUpdate) {		
		int res = productService.setAdminProductDelUpdate(idx, productDelUpdate);
		if(res==1) {
			return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
		}
		else {
			return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
		}
		
	}
	@RequestMapping(value="/adminSaleUpdate", method = RequestMethod.POST)
	public String adminSaleUpdatePost(int idx, String saleUpdate) {
		int res = productService.setAdminSaleUpdate(idx, saleUpdate);
		if(res==1) {
			return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
		}
		else {
			return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
		}
		
	}
	@RequestMapping(value="/adminSalePercentUpdate", method = RequestMethod.POST)
	public String adminSalePercentUpdatePost(int idx, String salePercentUpdate, String mainPriceSalePercent) {		
		int res = productService.setAdminSalePercentUpdate(idx, salePercentUpdate,mainPriceSalePercent);
		if(res==1) {
			return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
		}
		else {
			return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
		}
		
	}
	@RequestMapping(value="/adminContentImageUpdate", method = RequestMethod.POST)
	public String adminContentImageUpdatePost(int idx ,String content) {
			int  res = productService.setadminContentImageUpdate(idx,content);
			if(res==1) {
				return "redirect:/message/adminProductMainimageUpdateOk?idx="+idx;
			}
			else {
				return "redirect:/message/adminProductMainimageUpdateNo?idx="+idx;
			}					
		}
	
	@RequestMapping(value="/adminOptionUpdate", method = RequestMethod.POST)
	public String adminOptionUpdatePost(int idx,int productIdx ,String optionNameUpdate, String optionPriceUpdate) {
		int  res = productService.setAdminOptionUpdate(idx,optionNameUpdate,optionPriceUpdate);
		if(res==1) {
			return "redirect:/message/adminProductMainimageUpdateOk?idx="+productIdx;
		}
		else {
			return "redirect:/message/adminProductMainimageUpdateNo?idx="+productIdx;
		}			
	}
	@RequestMapping(value="/adminBrendUpdate", method = RequestMethod.POST)
	public String adminBrendUpdatePost(int productContentIdx,String productContentBrend, String productContentDisingenous, String productContentRecipe, String productContentSize) {
		int  res = productService.setAdminBrendUpdateUpdate(productContentIdx,productContentBrend,productContentDisingenous,productContentRecipe,productContentSize);
		if(res==1) {
			return "redirect:/message/adminProductMainimageUpdateOk?idx="+productContentIdx;
		}
		else {
			return "redirect:/message/adminProductMainimageUpdateNo?idx="+productContentIdx;
		}			
	}
	@RequestMapping(value = "/adminHomeSubTitle",method = RequestMethod.POST)
	public String adminHomeSubTitlePost(String homeSubTitle, String homeSubTitleText) {

		int res = productService.setAdminHomeSubTitle(homeSubTitle,homeSubTitleText);
		if(res==1) {
			return "redirect:/message/adminHomeSubTitleOk";
		}
		else {
			return "redirect:/message/adminHomeSubTitleNo";
		}
	}
	@RequestMapping(value = "/adminDilivery",method = RequestMethod.GET)
	public String adminDiliveryGet(Model model) {
		List<DbBaesongVO> baesongVOS = productService.getDbBaesongListShow();
		
		model.addAttribute("baesongVOS",baesongVOS);
		
		return "admin/adminDilivery";
	}
	@ResponseBody
	@RequestMapping(value = "/adminDiliveryUpdate",method = RequestMethod.POST)
	public String adminDiliveryUpdatePost(String baesongUp, int idx ) {		
		adminService.setadminDiliveryotrStuUpdate(baesongUp,idx);
		return "1";
	}
	
	@RequestMapping(value = "/adminCS",method = RequestMethod.GET)
	public String adminCSGet() {		
		return "admin/adminCS";
	}
	
	@RequestMapping(value = "/adminLevelUpdate",method = RequestMethod.POST)
	public String adminLevelUpdatePost(String levelUp,int idx) {
		adminService.setAdminLevelUpdate(levelUp,idx);
		return "redirect:/message/adminLevelUpdate?idx="+idx;
	}
	
	
	// Google Chart2 연습
	@RequestMapping(value="/chart/chart", method=RequestMethod.GET)
	public String chart2Get(Model model) {
		 List<MemberVO> memberList = adminService.getMemberChart();
		 List<ReturnsVO> returnsVOS = adminService.getAdminReturnList();
		 // 아래에 차트의 정보를 가져와야하는데 값을 보내줘야 가져올 수 있어서 가져옴
		 List<DbProductVO> productVOS = adminService.getProductMainVOS();
		 //정보를 가져왔으니까 가공해주는 곳 
		 List<DbProductVO> productMainVOS = adminService.getProductChart(productVOS);

		 model.addAttribute("memberList", memberList);
		 model.addAttribute("productMainVOS", productMainVOS);
		 model.addAttribute("returnsVOS", returnsVOS);
		return "admin/chart/chart";
	}					
	@ResponseBody
	@RequestMapping(value = "/adminMessageUpdate" , method = RequestMethod.POST) 
	public String adminMessageUpdatePost(String reMessage, int idx) {
		adminService.setAdminMessageUpdate(reMessage,idx);
		return "1";
	}
	@ResponseBody
	@RequestMapping(value = "/adminCupon" , method = RequestMethod.POST) 
	public String adminCuponPost(CuponVO cuponVO) {
		adminService.setAdminCupon(cuponVO);
		return "1";
	}
	@RequestMapping(value = "/returnCheckUpdate" , method = RequestMethod.POST) 
	public String returnCheckUpdatePost(String returnCategoryCode,Model model) {
		
		
		 List<MemberVO> memberList = adminService.getMemberChart();
		 List<ReturnsVO> returnsVOS = adminService.getAdminReturnList();
		 // 아래에 차트의 정보를 가져와야하는데 값을 보내줘야 가져올 수 있어서 가져옴
		 List<DbProductVO> productVOS = adminService.getProductMainVOS();
		 //정보를 가져왔으니까 가공해주는 곳 
		 List<DbProductVO> productMainVOS = adminService.getProductChart(productVOS);

		 model.addAttribute("memberList", memberList);
		 model.addAttribute("productMainVOS", productMainVOS);
		 model.addAttribute("returnsVOS", returnsVOS);
		 //찾아오기
		 DbBaesongVO baesongVO = productService.getBaesongReturn(returnCategoryCode);
		 //update 배송
		 int res =  productService.setBaesongStutesUpdate(baesongVO.getOrderIdx());
		 //리턴 업데이트
		 if(res ==1) {
			 int tes =  productService.setReturnStutesUpdate(baesongVO.getOrderIdx());
			 if(tes==1) {
				 //포인트 되돌려주기
				 memberService.setMemberPointReturn(baesongVO);
			 }
		 }
		 
		return "admin/chart/chart";
	}
	
	@RequestMapping(value = "/adminMemberSearch",method = RequestMethod.POST)
	public String adminMemberSearchPost(String searchFilter, String searchInput, Model model,
			@RequestParam(name="mid", defaultValue = "", required = false) String mid,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize
			) {
		List<MemberVO> memberVOS =  adminService.setMemberTypingList(searchFilter,searchInput);
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "member", "", mid);
		model.addAttribute("memberVos",memberVOS);
		model.addAttribute("pageVO",pageVO);
		return "admin/adminMemberList";
	}
	
	
	@RequestMapping(value = "/adminMemberDateSearch",method = RequestMethod.POST)
	public String adminMemberDateSearchPost(String startDate, String endDate,
			@RequestParam(name="mid", defaultValue = "", required = false) String mid,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			Model model
			) {
		List<MemberVO> memberVOS =  adminService.setMemberDateList(startDate,endDate);
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "member", "", mid);
		model.addAttribute("memberVos",memberVOS);
		model.addAttribute("pageVO",pageVO);		
		
		return "admin/adminMemberList";
	}
	
	@RequestMapping(value = "/gtp", method = RequestMethod.GET)
	public String gtp() {
		return "admin/gtp";
	}
	
}
