package com.spring.javaweb16S.vo;

import lombok.Data;

@Data
public class DbCartVO {
	private int idx;
	private String cartDate;
	private String mid;
	private int productIdx;
	private int brendContentIdx;
	private String productName;
	private int mainPrice;
	private String thumbImg;
	private String optionIdx;
	private String optionName;
	private String optionPrice;
	private String optionNum;
	private int totalPrice;
}
