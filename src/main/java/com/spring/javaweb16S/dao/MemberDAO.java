package com.spring.javaweb16S.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaweb16S.vo.DbBaesongVO;
import com.spring.javaweb16S.vo.DbCartVO;
import com.spring.javaweb16S.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getMemberIdCheck(@Param("mid")String mid);
	
	public void setMemberVisitProcess(@Param("vo")MemberVO vo);

	public int totRecCnt(@Param("mid") String mid);

	public MemberVO getMemberNickCheck(@Param("nickName")String nickName);

	public void setMemberJoinOk(@Param("vo")MemberVO vo);

	public void setMemberPwdUpdate(@Param("mid") String mid, @Param("pwd") String pwd);

	public MemberVO getMemberIdSerch(@Param("name")String name, @Param("nickName")String nickName, @Param("email")String email);

	public MemberVO getMemberInfo(@Param("mid")String mid);

	public void setMemberUpdate(@Param("vo")MemberVO vo,@Param("idx") int idx);

	public int setMemberDelete(@Param("mid")String mid);

	public List<MemberVO> getAdminMemberList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("mid") String mid);

	public int setAdminMemberDeleteOne(@Param("item") String item);

	public MemberVO getAdminMemberUser(@Param("idx")int idx);

	public List<DbBaesongVO> getAdminMemberUserBaesong(@Param("mid")String mid);

	public List<DbCartVO> getAdminMemberUserCart(@Param("mid") String mid);

	public MemberVO getMemberNickNameEmailCheck(@Param("nickName") String nickName, @Param("email") String email);

	public void setKakaoMemberInputOk(@Param("mid") String mid, @Param("pwd") String pwd, @Param("nickName") String nickName, @Param("email") String email);

	public void setMemberUserDelCheck(@Param("mid") String mid);

	public void setMemberPointUS(@Param("mid")String mid,@Param("resPoint") int resPoint);

	public void setMemberPointReturn(@Param("baesongVO")DbBaesongVO baesongVO);

}
