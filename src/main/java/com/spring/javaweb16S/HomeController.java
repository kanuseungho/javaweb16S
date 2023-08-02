package com.spring.javaweb16S;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.javaweb16S.pagination.PageProcess;
import com.spring.javaweb16S.pagination.PageVO;
import com.spring.javaweb16S.service.AdminService;
import com.spring.javaweb16S.service.ProductService;
import com.spring.javaweb16S.vo.BannerVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.NoticeVO;
import com.spring.javaweb16S.vo.ReturnsVO;
import com.spring.javaweb16S.vo.SubTitleVO;



@Controller
public class HomeController {
	@Autowired
	AdminService adminService;
	@Autowired
	ProductService productService;
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,HttpSession session,
			@RequestParam(name="pag", defaultValue = "1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue = "4", required=false) int pageSize,
			@RequestParam(name="part", defaultValue = "접시", required = false) String part
			) {
		List<BannerVO>  bannerVOS = adminService.getImageBanner();
		NoticeVO noticeVO = adminService.getTopBanner();
		List<SubTitleVO> subTitleVOS =adminService.getTitleShow();
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, part, "", "");
		List<DbProductVO> productVOS = productService.getProductList(pageVO.getStartIndexNo(), pageSize, part);
		String orderStu = "";
		Date currentDate = new Date();

		// Add 10 hours to the current date
		long tenMinInMillis = 10 * 60  * 1000; // 10 hours in milliseconds
		long twoMinInMillis = 20 * 60  * 1000; // 10 hours in milliseconds
		Date tenMinLater = new Date(currentDate.getTime() + tenMinInMillis);
		Date twoMinLater = new Date(currentDate.getTime() + twoMinInMillis);

		// Compare the current date with the date 10 hours later
		if (currentDate.after(tenMinLater)) {
		    orderStu ="배송중";
		    adminService.setDbBaesongUpdate(orderStu);
		} 
		if(currentDate.after(twoMinLater)) {
			orderStu ="배송완료";
			adminService.setDbBaesongUpdate(orderStu);
		}
		adminService.setCouponDeleteDate();
		model.addAttribute("bannerVOS",bannerVOS);
		model.addAttribute("subTitleVOS",subTitleVOS);
		model.addAttribute("noticeVO",noticeVO);
		String mid = (String) session.getAttribute("sMid");
		List<ReturnsVO> returnVOS = productService.getMyClaimList(mid);
		model.addAttribute("part", part);
		model.addAttribute("returnVOS",returnVOS);
		model.addAttribute("productVOS",productVOS);
		return "home";
	}
	
}
