package com.spring.javaweb16S.service;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.common.JavawebProvide;
import com.spring.javaweb16S.dao.AdminDAO;
import com.spring.javaweb16S.vo.ReviewVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	AdminDAO adminDAO;
	@Override
	public String getPageContent(String view) {
		// TODO Auto-generated method stub
		return null;
	}
	/*
	 * @Autowired MemberDAO memberDAO;
	 */

	@Override
	public void memberClaimUpdate(String value, int idx) {
		adminDAO.memberClaimUpdate(value,idx);
		
	}

	@Override
	public void setMemberCouponStuUpdate(String mid, String coupon) {
		adminDAO.setMemberCouponStuUpdate(mid,coupon);
		
	}

	@Override
	public int setReviewSub(MultipartFile reviewPhoNatome, ReviewVO reviewVO) {
		int res = 0;
		if (reviewVO.getAgreement2() == null || reviewVO.getAgreement2().isEmpty()) {
		    reviewVO.setAgreement2("NO");
		}

		if (reviewVO.getChoiceAgreement() == null || reviewVO.getChoiceAgreement().isEmpty()) {
		    reviewVO.setChoiceAgreement("YES");
		}
	    reviewVO.setReviewStu("YES");
	    try {
	        String oFileName = reviewPhoNatome.getOriginalFilename();
	        
	        if (oFileName.equals("")) {
	        	reviewVO.setFreviewSAName("noimage.jpg");
	        } 
	        else {
	            UUID uid = UUID.randomUUID();
	            String saveFileName = uid + "_" + oFileName;
	            JavawebProvide jp = new JavawebProvide(); // 수정: 객체 생성 부분
	            jp.writeFile(reviewPhoNatome, saveFileName, "review");
	            
	            reviewVO.setFreviewSAName(saveFileName);
	        }
	        //adminDAO.setUploadOk(vo,imageFile);
	        adminDAO.setDbbaesongUpdate(reviewVO);
	        adminDAO.setReviewPhoto(reviewVO);
	        res = 1;
	    } catch (IOException e) {
	        e.printStackTrace();
	    } 
	    res=1;
	    return res;		
	}
	
}
