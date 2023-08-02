package com.spring.javaweb16S;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
	
	@RequestMapping(value = "/message/{msgFlag}", method = RequestMethod.GET)
	public String listGet(@PathVariable String msgFlag,
			@RequestParam(name="mid", defaultValue = "", required=false) String mid,
			@RequestParam(name="maskedMid", defaultValue = "", required=false) String maskedMid,
			@RequestParam(name="idx", defaultValue = "1", required=false) int idx,
			Model model) {
		
		if(msgFlag.equals("adminLogout")) {
			model.addAttribute("msg", "관리자 로그아웃");
			model.addAttribute("url", "/");
		}		
		else if(msgFlag.equals("memberNo")) {
			model.addAttribute("msg", "회원이 아니십니다");
			model.addAttribute("url", "/");
		}		
		else if(msgFlag.equals("levelCheckNo")) {
			model.addAttribute("msg", "등급에 맞지 않습니다");
			model.addAttribute("url", "/");
		}		
		else if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("msg", mid + "님 로그인 되셨습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("msg", mid + "로그인 실패~~");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberLogout")) {
			model.addAttribute("msg", mid + "로그아웃 되었습니다.");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberNickCheckNo")) {
			model.addAttribute("msg", "닉네임을 확인하세요.");
			model.addAttribute("url", "/member/memberJoin");
		}
		else if(msgFlag.equals("idCheckNo")) {
			model.addAttribute("msg", "아이디가 중복되었습니다.");
			model.addAttribute("url", "/member/memberJoin");
		}	
		else if(msgFlag.equals("memberJoinOk")) {
			model.addAttribute("msg", "회원가입완료!!!");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberJoinNo")) {
			model.addAttribute("msg", "회원가입 실패~~");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberIdSeachOk")) {
			model.addAttribute("msg", "아이디는"+maskedMid+"입니다");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberIdSeachNo")) {
			model.addAttribute("msg", "입력하신 정보에 일치하는 회원이 없습니다");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberEmailCheckNo")) {
			model.addAttribute("msg", "회원 메일주소를 확인해 주세요.");
			model.addAttribute("url", "/member/memberPwdFind");
		}
		else if(msgFlag.equals("memberIdCheckNo")) {
			model.addAttribute("msg", "회원아이디를 확인해 주세요.");
			model.addAttribute("url", "/member/memberPwdFind");
		}
		else if(msgFlag.equals("memberImsiPwdOk")) {
			model.addAttribute("msg", "임시비밀번호가 발급되었습니다.\\n가입된 메일을 확인후 비밀번호를 변경처리해 주세요.");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberImsiPwdNo")) {
			model.addAttribute("msg", "임시비밀번호가 발급 실패~~");
			model.addAttribute("url", "/member/memberPwdFind");
		}
		
		else if(msgFlag.equals("memberUpdateOk")) {
			model.addAttribute("msg", "수정이 되었습니다");
			model.addAttribute("url", "/");
		}
		
		else if(msgFlag.equals("memberUpdateNo")) {
			model.addAttribute("msg", "수정실패~~");
			model.addAttribute("url", "/myPage/profile");
		}
		else if(msgFlag.equals("memberDeleteOk")) {
			model.addAttribute("msg", "탈퇴되었습니다");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memberDeleteNo")) {
			model.addAttribute("msg", "탈퇴 실패하였습니다 고객센터로 문의바랍니다");
			model.addAttribute("url", "/myPage/secession");
		}
		else if(msgFlag.equals("productDishInputOk")) {
			model.addAttribute("msg", "업로드 성공");
			model.addAttribute("url", "/tableWere/dish");
		}
		else if(msgFlag.equals("productDishInputNo")) {
			model.addAttribute("msg", "업로드 실패");
			model.addAttribute("url", "/tableWere/dish");
		}
		else if(msgFlag.equals("dbProductInputOk")) {
			model.addAttribute("msg", "업로드 완료 되었습니다 더 많이 올려주세요!");
			model.addAttribute("url", "/dbShop/dbProduct");
		}
		else if(msgFlag.equals("dbOptionInputOk")) {
			model.addAttribute("msg", "옵션 추가 완료 완료 되었습니다 더 많이 올려주세요!");
			model.addAttribute("url", "/dbShop/dbOption");
		}
		else if(msgFlag.equals("dbOptionInput2Ok")) {
			model.addAttribute("msg", "옵션 추가 완료 완료 되었습니다 더 많이 올려주세요!");
			model.addAttribute("url", "/dbShop/dbOption");
		}
		else if(msgFlag.equals("dbShopContentOk")) {
			model.addAttribute("msg", "추가 정보 넣기 성공!!!!");
			model.addAttribute("url", "/dbShop/dbShopList");
		}
		else if(msgFlag.equals("dbShopContentNo")) {
			model.addAttribute("msg", "정보 입력 실패 다시 입력하세요!!!!");
			model.addAttribute("url", "/dbShop/dbShopList");
		}
		else if(msgFlag.equals("uploadImageOk")) {
			model.addAttribute("msg", "배너 입력 성공");
			model.addAttribute("url", "/admin/adminBannerPhoto");
		}
		else if(msgFlag.equals("uploadImageNo")) {
			model.addAttribute("msg", "배너 입력 실패");
			model.addAttribute("url", "/admin/adminBannerPhoto");
		}
		else if(msgFlag.equals("uploadImageUpdateOk")) {
			model.addAttribute("msg", "배너 수정 성공");
			model.addAttribute("url", "/admin/adminBannerPhoto");
		}
		else if(msgFlag.equals("uploadImageUpdateNo")) {
			model.addAttribute("msg", "수정 실패 배너");
			model.addAttribute("url", "/admin/adminBannerPhoto");
		}
		else if(msgFlag.equals("adminMainBannerTopOk")) {
			model.addAttribute("msg", "공지 등록 성공");
			model.addAttribute("url", "/admin/adminBannerPhoto");
		}
		else if(msgFlag.equals("adminMainBannerTopNo")) {
			model.addAttribute("msg", "공지 등록 실패");
			model.addAttribute("url", "/admin/adminBannerPhoto");
		}
		else if(msgFlag.equals("cartOrderOk")) {
			model.addAttribute("msg", "장바구니에 상품이 등록되었습니다.");
			model.addAttribute("url", "/product/tableWere/dishContent");
		}
		else if(msgFlag.equals("cartInputOk")) {
			model.addAttribute("msg", "장바구니에 상품이 등록되었습니다.\\n즐거운 쇼핑되세요.");
			model.addAttribute("url", "/product/tableWere/dishContent");
		}
		else if(msgFlag.equals("cartEmpty")) {
			model.addAttribute("msg", "장바구니가 비어있습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("paymentResultOk")) {
			model.addAttribute("msg", "결제가 정상적으로 완료되었습니다.");
			model.addAttribute("url", "/myPage/paymentResultOk");
		}
		else if(msgFlag.equals("adminProductMainimageUpdateOk")) {
			model.addAttribute("msg", "수정 성공");
			model.addAttribute("url", "/admin/dbShop/dbShopRedefinedUpdate?idx="+idx);
		}
		else if(msgFlag.equals("adminProductMainimageUpdateNo")) {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("url", "/admin/dbShop/dbShopRedefinedUpdate?idx="+idx);
		}
		else if(msgFlag.equals("adminHomeSubTitleOk")) {
			model.addAttribute("msg", "입력완료");
			model.addAttribute("url", "/admin/adminBannerPhoto");
		}
		else if(msgFlag.equals("adminHomeSubTitleNo")) {
			model.addAttribute("msg", "입력실패");
			model.addAttribute("url", "/admin/adminBannerPhoto");
		}
		else if(msgFlag.equals("deliveryUpdateMemberNo")) {
			model.addAttribute("msg", "수정실패 다시 재입장해주세요");
			model.addAttribute("url", "/myPage/paymentResultOk");
		}
		else if(msgFlag.equals("adminDiliveryUpdateOk")) {
			model.addAttribute("msg", "업데이트성공");
			model.addAttribute("url", "/admin/adminDilivery");
		}
		else if(msgFlag.equals("customerReturnsNo")) {
			model.addAttribute("msg", "일치하는 제품 코드가 없습니다");
			model.addAttribute("url", "/myPage/customer/returns");
		}
		else if(msgFlag.equals("adminReturnReportOk")) {
			model.addAttribute("msg", "신청 되었습니다");
			model.addAttribute("url", "/myPage/customer/returns");
		}
		else if(msgFlag.equals("adminReturnReportNo")) {
			model.addAttribute("msg", "신청 할 수 없습니다");
			model.addAttribute("url", "/myPage/customer/returns");
		}
		else if(msgFlag.equals("adminLevelUpdate")) {
			model.addAttribute("msg", "level");
			model.addAttribute("url", "/member/adminMemberListUser?idx="+idx);
		}
		else if(msgFlag.equals("myPageLogin")) {
			model.addAttribute("msg", "로그인 후 이용가능합니다");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("setIntairaStoryOk")) {
			model.addAttribute("msg", "등록되었습니다");
			model.addAttribute("url", "/product/intairastory");
		}
		else if(msgFlag.equals("setIntairaStoryNo")) {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "/product/intairastory");
		}
		else if(msgFlag.equals("reviewSubOK")) {
			model.addAttribute("msg", "리뷰는 검토 후 게시됩니다!");
			model.addAttribute("url", "/myPage/paymentResultOk");
		}
		else if(msgFlag.equals("reviewSubNO")) {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "/myPage/paymentResultOk");
		}
		return "include/message";
	}
	
	
}
