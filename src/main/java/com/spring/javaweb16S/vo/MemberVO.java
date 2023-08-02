package com.spring.javaweb16S.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String name;
	private String gender;
	private String birthday;
	private String tel;	
	private String email;
	private String photo;	
	private String userDel;
	private int point;
	private int level;
	private int visitCnt;
	private String startDate;	
	private int todayCnt;

	private int deleteDiff;
	
  
	
	
	private String title;
	private String part;

	/* 최근 방문자수 담을필드 */
	private String visitDate;
	private int visitCount;
}
