package com.spring.javaweb16S.vo;

import lombok.Data;

@Data
public class CuponVO {
	private int idx;
	private String couponCode;
	private String couponName;
	private String couponAmount;
	private String expirationDate;
	private String couponMid;
	private String couponStu;
}
