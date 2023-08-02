package com.spring.javaweb16S.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.vo.DbBaesongVO;
import com.spring.javaweb16S.vo.DbCartVO;
import com.spring.javaweb16S.vo.MemberVO;

public interface MemberService {
	public MemberVO getMemberIdCheck(String mid);

	public void setMemberVisitProcess(MemberVO vo);

	public MemberVO getMemberNickCheck(String nickName);

	public int setMemberJoinOk(MultipartFile fName, MemberVO vo);

	public void setMemberPwdUpdate(String mid, String encode);

	public MemberVO getMemberIdSerch(String name, String nickName, String email);

	public MemberVO getMemberInfo(String mid);

	public int memberUpdate(MultipartFile fName, MemberVO vo, int idx);

	public int setMemberDelete(String mid);

	public List<MemberVO> getAdminMemberList(int startIndexNo, int pageSize, String mid);

	public int setAdminMemberDeleteOne(String item);

	public MemberVO getAdminMemberUser(int idx);

	public List<DbBaesongVO> getAdminMemberUserBaesong(String mid);

	public List<DbCartVO> getAdminMemberUserCart(String mid);

	public MemberVO getMemberNickNameEmailCheck(String nickName, String email);

	public void setKakaoMemberInputOk(String mid, String pwd, String nickName, String email);

	public void setMemberUserDelCheck(String mid);

	public void setMemberPointUS(String mid, int resPoint);

	public void setMemberPointReturn(DbBaesongVO baesongVO);
}
