package com.spring.javaweb16S.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.vo.BannerVO;
import com.spring.javaweb16S.vo.CuponVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.MemberVO;
import com.spring.javaweb16S.vo.NoticeVO;
import com.spring.javaweb16S.vo.ReturnsVO;
import com.spring.javaweb16S.vo.SubTitleVO;

public interface AdminService {

	public int setUploadImageOk(MultipartFile imageFile, BannerVO vo);

	public BannerVO getUploadCheck(BannerVO vo);

	public int setUploadImageUpdateOk(MultipartFile file, BannerVO vo);

	public int setAdminMainBannerTopInput(String topBanner);

	public List<BannerVO> getImageBanner();

	public NoticeVO getTopBanner();

	public List<SubTitleVO> getTitleShow();

	public void setDbBaesongUpdate(String orderStu);

	public void setAdminLevelUpdate(String levelUp, int idx);

	public List<HashMap<String, Object>> admin_findDate(String date1, String date2);

	public List<MemberVO> getMemberChart();

	public List<ReturnsVO> getAdminReturnList();

	public void setAdminMessageUpdate(String reMessage, int idx);

	public List<DbProductVO> getProductChart(List<DbProductVO> productVOS);

	public List<DbProductVO> getProductMainVOS();

	public void setAdminCupon(CuponVO cuponVO);

	public CuponVO getCouponMemberInsertSerch(int idx);

	public void setCouponMember(CuponVO cuponInsertVO, String mid);

	public CuponVO getCouponMemberSerch(String code, String mid);

	public void setCouponDeleteDate();

	public void setadminDiliveryotrStuUpdate(String baesongUp, int idx);

	public List<MemberVO> setMemberTypingList(String searchFilter, String searchInput);

	public List<MemberVO> setMemberDateList(String startDate, String endDate);

	

	

}
