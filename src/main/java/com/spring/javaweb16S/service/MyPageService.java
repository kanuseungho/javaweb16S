package com.spring.javaweb16S.service;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.vo.ReviewVO;

public interface MyPageService {

	public	String getPageContent(String view);

	public void memberClaimUpdate(String value, int idx);

	public void setMemberCouponStuUpdate(String mid, String coupon);

	public int setReviewSub(MultipartFile reviewPhoNatome, ReviewVO reviewVO);

}
