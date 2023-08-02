package com.spring.javaweb16S.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.vo.DbBaesongVO;
import com.spring.javaweb16S.vo.DbOptionVO;
import com.spring.javaweb16S.vo.DbProductVO;

public interface DbShopService {

	public List<DbProductVO> getCategoryMain();

	public void setCategoryMainInput(DbProductVO vo);

	public DbProductVO getCategoryMainOne(String categoryMainCode, String categoryMainName);

	public List<DbProductVO> getCategoryMiddle();

	public DbProductVO getCategoryMiddleOne(DbProductVO vo);

	public void setCategoryMiddleInput(DbProductVO vo);

	public List<DbProductVO> getCategorySub();

	public List<DbProductVO> getCategoryMiddleName(String categoryMainCode);

	public DbProductVO getCategorySubOne(DbProductVO vo);

	public void setCategorySubInput(DbProductVO vo);

	public List<DbProductVO> getCategorySubName(String categoryMainCode, String categoryMiddleCode);

	public List<DbProductVO> getCategoryProductName(String categoryMainCode, String categoryMiddleCode, String categorySubCode);

	public void imgCheckProductInput(MultipartFile file, DbProductVO vo);

	public List<DbProductVO> getSubTitle();

	public List<DbProductVO> getDbShopList(String part);

	public DbProductVO getDbShopProduct(int idx);

	public void setDbShopDelete(String mainCode);

	public void setDbShopMiddleDelete(String middleCode);

	public void setDbShopSubDelete(String subCode);
	
	public DbProductVO getProductInfor(String productName);

	public List<DbOptionVO> getOptionList(int productIdx);

	public void setDbOptionInput(DbOptionVO vo);

	public int getOptionSame(int productIdx, String optionName);

	public void setOptionDelete(int idx);

	public List<DbOptionVO> getDbShopOption(int productIdx);

	public void setCategoryMainDelete(String categoryMainCode);

	public void setCategoryMiddleDelete(String categoryMiddleCode);

	public DbProductVO getDbProductOne(String categorySubCode);

	public void setCategorySubDelete(String categorySubCode);

	public int setDbShopContentBrend(int idx, DbProductVO vo);

	public void dbCartDelete(int idx);

	public List<DbProductVO> getProductList(int startIndexNo, int pageSize, String part);

	public List<DbBaesongVO> getMyOrderList(int startIndexNo, int pageSize, String mid);

	public List<DbBaesongVO> getOrderCondition(String mid, int conditionDate, int startIndexNo, int pageSize);

	public List<DbBaesongVO> getOrderBaesong(String orderIdx);

	public List<DbBaesongVO> getMyOrderStatus(int startIndexNo, int pageSize, String mid, String startJumun,
			String endJumun, String conditionOrderStatus);

}
