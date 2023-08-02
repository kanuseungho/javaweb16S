package com.spring.javaweb16S.vo;

import lombok.Data;

@Data
public class DbProductVO {
	private int idx;
	private String productCode;
	private String productName;
	private String detail;
	private int mainPrice;
	private String fSName;
	private String content;
	private String productDel;
	private String sale;
	private int salePrice;
	private int salePercent;
	private String WDate;
	private String part;
	private int count;

	
	
	private String categoryMainCode;
	private String categoryMainName;
	private String categoryMiddleCode;
	private String categoryMiddleName;
	private String categorySubCode;
	private String categorySubName;
	
	
	private int brendContentIdx; 
	private String brend; 
	private String disingenuous;
	private String recipe;
	private String size;
	
	
	
	private String optionName; 
	private String optionPrice;
	
	
	private int day_diff;		// 날짜 차이 계산 필드(1일차이 계산)
	private int hour_diff;	// 날짜 차이 계산 필드(24시간차이 계산)
	
	// 이전글/다음글을 위한 변수 설정
	private int preIdx;
	private int nextIdx;
	private String preTitle;
	private String nextTitle;
}
