package com.spring.javaweb16S.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int idx; 
	private String star; 
	private String agreement1; 
	private String agreement2; 
	private String reviewText; 
	private String freviewSAName; 
	private String reviewStu; 

	private int baesongIdx; 
	private int baesongoIdx; 
	private String reviewPhoto; 
	private String choiceAgreement; 
	

	private String orderIdx; 
	private String productName; 
	private String optionName; 
	private String optionNum; 
	private String mid; 
	private String detail; 
	private int oridx; 
	private int productIdx; 
}
