package com.spring.javaweb16S.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.vo.BannerVO;
import com.spring.javaweb16S.vo.CuponVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.MemberVO;
import com.spring.javaweb16S.vo.NoticeVO;
import com.spring.javaweb16S.vo.ReturnsVO;
import com.spring.javaweb16S.vo.ReviewVO;
import com.spring.javaweb16S.vo.SubTitleVO;

public interface AdminDAO {

	

	//public void setUploadOk(@Param("vo") BannerVO vo,@Param("imageFile") MultipartFile imageFile);
	public void setUploadOk(@Param("vo") BannerVO vo);

	public BannerVO getUploadCheck(@Param("vo") BannerVO vo);

	public void setUploadUpdateOk( @Param("vo") BannerVO vo);

	public int setAdminMainBannerTopInput(@Param("topBanner")String topBanner);

	public List<BannerVO> getImageBanner();

	public NoticeVO getTopBanner();

	public List<SubTitleVO> getTitleShow();

	public void setDbBaesongUpdate(@Param("orderStu")String orderStu);

	public void setAdminLevelUpdate(@Param("levelUp")String levelUp,@Param("idx") int idx);

	public List<HashMap<String, Object>> admin_findDate(@Param("date1")String date1,@Param("date2") String date2);

	public List<MemberVO> getMemberChart();

	public List<ReturnsVO> getAdminReturnList();

	public void setAdminMessageUpdate(@Param("reMessage")String reMessage, @Param("idx")int idx,@Param("returnStus")  String returnStus);

	public List<DbProductVO> getProductChart(@Param("productVOS")List<DbProductVO> productVOS);

	public List<DbProductVO> getProductMainVOS();

	public void memberClaimUpdate(@Param("value")String value, @Param("idx")int idx);

	public void setAdminCupon(@Param("cuponVO")CuponVO cuponVO);

	public CuponVO getCouponMemberInsertSerch(@Param("idx") int idx);

	public void setCouponMember(@Param("cuponInsertVO")CuponVO cuponInsertVO,@Param("mid") String mid);

	public CuponVO getCouponMemberSerch(@Param("code")String code,@Param("mid") String mid);

	public void setCouponDeleteDate();

	public void setMemberCouponStuUpdate(@Param("mid")String mid,@Param("coupon") String coupon);

	public void setReviewPhoto(@Param("reviewVO")ReviewVO reviewVO);

	public void setDbbaesongUpdate(@Param("reviewVO")ReviewVO reviewVO);

	public void setadminDiliveryotrStuUpdate(@Param("baesongUp")String baesongUp,@Param("idx") int idx);

	public List<MemberVO> setMemberTypingList(@Param("searchFilter")String searchFilter, @Param("searchInput") String searchInput);

	public List<MemberVO> setMemberDateList(@Param("startDate")String startDate,@Param("endDate") String endDate);

	




}
