package com.spring.javaweb16S.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.common.JavawebProvide;
import com.spring.javaweb16S.dao.MemberDAO;
import com.spring.javaweb16S.vo.DbBaesongVO;
import com.spring.javaweb16S.vo.DbCartVO;
import com.spring.javaweb16S.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public MemberVO getMemberIdCheck(String mid) {

		return memberDAO.getMemberIdCheck(mid);
	}

	@Override
	public void setMemberVisitProcess(MemberVO vo) {
		memberDAO.setMemberVisitProcess( vo);
	}

	@Override
	public MemberVO getMemberNickCheck(String nickName) {
		
		return memberDAO.getMemberNickCheck(nickName);
	}

	@Override
	public int setMemberJoinOk(MultipartFile fName, MemberVO vo) {
    int res = 0;
    
    try {
        String oFileName = fName.getOriginalFilename();
        
        if (oFileName.equals("")) {
            vo.setPhoto("noimage.jpg");
        } 
        else {
            UUID uid = UUID.randomUUID();
            String saveFileName = uid + "_" + oFileName;
            
            JavawebProvide jp = new JavawebProvide(); // 수정: 객체 생성 부분
            jp.writeFile(fName, saveFileName, "member");
            
            vo.setPhoto(saveFileName);
        }
        memberDAO.setMemberJoinOk(vo);
        res = 1;
    } catch (IOException e) {
        e.printStackTrace();
    }
    
    res=1;
    return res;
	}

	@Override
	public void setMemberPwdUpdate(String mid, String pwd) {
		memberDAO.setMemberPwdUpdate(mid, pwd);
	}

	@Override
	public MemberVO getMemberIdSerch(String name, String nickName, String email) {
		
		return memberDAO.getMemberIdSerch(name,  nickName,  email);
	}

	@Override
	public MemberVO getMemberInfo(String mid) {
		
		return memberDAO.getMemberInfo(mid);
	}

	@Override
	public int memberUpdate(MultipartFile fName, MemberVO vo, int idx) {
		 int res = 0;
		    try {
		        String oFileName = fName.getOriginalFilename();
		        
		        if (oFileName.equals("")) {
		            vo.setPhoto("noimage.jpg");
		        } 
		        else {
		            UUID uid = UUID.randomUUID();
		            String saveFileName = uid + "_" + oFileName;
		            
		            JavawebProvide jp = new JavawebProvide(); // 수정: 객체 생성 부분
		            jp.writeFile(fName, saveFileName, "member");
		            
		            vo.setPhoto(saveFileName);
		        }
		        memberDAO.setMemberUpdate(vo,idx);
		        res = 1;
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    
		    res=1;
		    return res;
	}

	@Override
	public int setMemberDelete(String mid) {
		
		return memberDAO.setMemberDelete(mid);
	}

	@Override
	public List<MemberVO> getAdminMemberList(int startIndexNo, int pageSize, String mid) {
		
		return memberDAO.getAdminMemberList(startIndexNo, pageSize, mid);
	}

	@Override
	public int setAdminMemberDeleteOne(String item) {
		return memberDAO.setAdminMemberDeleteOne(item);
	}

	@Override
	public MemberVO getAdminMemberUser(int idx) {
		return memberDAO.getAdminMemberUser(idx);
	}

	@Override
	public List<DbBaesongVO> getAdminMemberUserBaesong(String mid) {
		// TODO Auto-generated method stub
		return memberDAO.getAdminMemberUserBaesong(mid);
	}

	@Override
	public List<DbCartVO> getAdminMemberUserCart(String mid) {
		// TODO Auto-generated method stub
		return memberDAO.getAdminMemberUserCart(mid);
	}

	@Override
	public MemberVO getMemberNickNameEmailCheck(String nickName, String email) {
		// TODO Auto-generated method stub
		return memberDAO.getMemberNickNameEmailCheck(nickName, email);
	}

	@Override
	public void setKakaoMemberInputOk(String mid, String pwd, String nickName, String email) {
		memberDAO.setKakaoMemberInputOk(mid, pwd, nickName, email);
		
	}

	@Override
	public void setMemberUserDelCheck(String mid) {
		memberDAO.setMemberUserDelCheck(mid);
		
	}

	@Override
	public void setMemberPointUS(String mid, int resPoint) {
		memberDAO.setMemberPointUS(mid,resPoint);
		
	}

	@Override
	public void setMemberPointReturn(DbBaesongVO baesongVO) {
		memberDAO.setMemberPointReturn(baesongVO);
		
	}
}
