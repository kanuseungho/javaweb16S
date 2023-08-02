package com.spring.javaweb16S.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.common.JavawebProvide;
import com.spring.javaweb16S.dao.AdminDAO;
import com.spring.javaweb16S.vo.BannerVO;
import com.spring.javaweb16S.vo.CuponVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.MemberVO;
import com.spring.javaweb16S.vo.NoticeVO;
import com.spring.javaweb16S.vo.ReturnsVO;
import com.spring.javaweb16S.vo.SubTitleVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public int setUploadImageOk(MultipartFile imageFile, BannerVO vo) {
		 int res = 0;
		    
		    try {
		        String oFileName = imageFile.getOriginalFilename();
		        
		        if (oFileName.equals("")) {
		            vo.setImageFile("noimage.jpg");
		        } 
		        else {
		            UUID uid = UUID.randomUUID();
		            String saveFileName = uid + "_" + oFileName;
		            JavawebProvide jp = new JavawebProvide(); // 수정: 객체 생성 부분
		            jp.writeFile(imageFile, saveFileName, "banner");
		            
		            vo.setImageFile(saveFileName);
		        }
		        //adminDAO.setUploadOk(vo,imageFile);
		        adminDAO.setUploadOk(vo);
		        res = 1;
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    res=1;
		    return res;
	}

	@Override
	public BannerVO getUploadCheck(BannerVO vo) {
		// TODO Auto-generated method stub
		return adminDAO.getUploadCheck(vo);
	}

	@Override
	public int setUploadImageUpdateOk(MultipartFile file, BannerVO vo) {
		int res = 0;
	    
	    try {
	        String oFileName = file.getOriginalFilename();
	        
	        if (oFileName.equals("")) {
	            vo.setImageFile("noimage.jpg");
	        } 
	        else {
	            UUID uid = UUID.randomUUID();
	            String saveFileName = uid + "_" + oFileName;
	            
	            JavawebProvide jp = new JavawebProvide(); // 수정: 객체 생성 부분
	            jp.writeFile(file, saveFileName, "banner");
	            
	            vo.setImageFile(saveFileName);
	        }
	        adminDAO.setUploadUpdateOk(vo);
	        res = 1;
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    res=1;
	    return res;
	}

	@Override
	public int setAdminMainBannerTopInput(String topBanner) {
		// TODO Auto-generated method stub
		return adminDAO.setAdminMainBannerTopInput(topBanner);
	}

	@Override
	public List<BannerVO> getImageBanner() {
		// TODO Auto-generated method stub
		return adminDAO.getImageBanner();
	}

	@Override
	public NoticeVO getTopBanner() {
		// TODO Auto-generated method stub
		return adminDAO.getTopBanner();
	}

	@Override
	public List<SubTitleVO> getTitleShow() {
		// TODO Auto-generated method stub
		return adminDAO.getTitleShow();
	}

	@Override
	public void setDbBaesongUpdate(String orderStu) {
		adminDAO.setDbBaesongUpdate(orderStu);
		
	}	

	@Override
	public void setAdminLevelUpdate(String levelUp , int idx) {
		adminDAO.setAdminLevelUpdate(levelUp,idx);
		
	}

	@Override
	public List<HashMap<String, Object>> admin_findDate(String date1, String date2) {
		
		return adminDAO.admin_findDate(date1,date2);
	}

	@Override
	public List<MemberVO> getMemberChart() {
		// TODO Auto-generated method stub
		return adminDAO.getMemberChart();
	}

	@Override
	public List<ReturnsVO> getAdminReturnList() {
		
		return adminDAO.getAdminReturnList();
	}

	@Override
	public void setAdminMessageUpdate(String reMessage, int idx) {
		String returnStus = "답변완료";
		adminDAO.setAdminMessageUpdate(reMessage, idx,returnStus);
		
	}

	@Override
	public List<DbProductVO> getProductChart(List<DbProductVO> productVOS) {
		// TODO Auto-generated method stub
		return adminDAO.getProductChart(productVOS);
	}

	@Override
	public List<DbProductVO> getProductMainVOS() {
		// TODO Auto-generated method stub
		return adminDAO.getProductMainVOS();
	}

	@Override
	public void setAdminCupon(CuponVO cuponVO) {
		
		adminDAO.setAdminCupon(cuponVO);
	}


	@Override
	public CuponVO getCouponMemberInsertSerch(int idx) {
		// TODO Auto-generated method stub
		return adminDAO.getCouponMemberInsertSerch(idx);
	}

	@Override
	public void setCouponMember(CuponVO cuponInsertVO, String mid) {
		adminDAO.setCouponMember(cuponInsertVO,mid);
		
	}

	@Override
	public CuponVO getCouponMemberSerch(String code, String mid) {
		// TODO Auto-generated method stub
		return adminDAO.getCouponMemberSerch(code, mid);
	}

	@Override
	public void setCouponDeleteDate() {
		adminDAO.setCouponDeleteDate();
		
	}

	@Override
	public void setadminDiliveryotrStuUpdate(String baesongUp, int idx) {
		adminDAO.setadminDiliveryotrStuUpdate(baesongUp,idx);
		
	}

	@Override
	public List<MemberVO> setMemberTypingList(String searchFilter, String searchInput) {
		// TODO Auto-generated method stub
		return adminDAO.setMemberTypingList(searchFilter,searchInput);
	}

	@Override
	public List<MemberVO> setMemberDateList(String startDate, String endDate) {
		// TODO Auto-generated method stub
		return adminDAO.setMemberDateList(startDate,endDate);
	}



	
	
}
