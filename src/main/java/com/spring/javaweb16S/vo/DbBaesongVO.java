package com.spring.javaweb16S.vo;

import lombok.Data;

@Data
public class DbBaesongVO {
  private int idx;
  
  //0720 review페이지 작업 할 때 두번 째 글짜 oIdx가 대문자여서 오류가 뜸 그래서 바뀌줌 
  private int oidx;
  
  
  
  
  private String orderIdx;
  private int orderTotalPrice;
  private String mid;
  private String name;
  private String address;
  private String tel;
  private String message;
  private String payment;
  private String payMethod;
  private String orderStatus;
  private String baesongImg; 
  // 아래는 주문테이블에서 사용된 필드리스트이다.
	private int productIdx;
	private String orderDate;
	private String productName;
	private int mainPrice;
	private String thumbImg;
	private String optionName;
	private String optionPrice;
	private String optionNum;
	private int totalPrice;
	private String membership;
	private int membershipPrice;
}
