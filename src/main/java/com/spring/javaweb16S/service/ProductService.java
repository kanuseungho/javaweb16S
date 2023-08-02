package com.spring.javaweb16S.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.vo.BrendVO;
import com.spring.javaweb16S.vo.CuponVO;
import com.spring.javaweb16S.vo.DbBaesongVO;
import com.spring.javaweb16S.vo.DbCartVO;
import com.spring.javaweb16S.vo.DbOptionVO;
import com.spring.javaweb16S.vo.DbOrderVO;
import com.spring.javaweb16S.vo.DbProductVO;
import com.spring.javaweb16S.vo.IntairastoryVO;
import com.spring.javaweb16S.vo.ReturnsVO;
import com.spring.javaweb16S.vo.ReviewVO;

public interface ProductService {

	public List<DbProductVO> getProductList(int startIndexNo, int pageSize, String part);

	public DbProductVO getDbShopProduct(int idx);

	public List<DbOptionVO> getDbShopOption(int productIdx);

	public DbProductVO getProductDetailedShow(int idx);

	public List<DbOptionVO> getDbShopOptionShow(int idx);

	public DbCartVO getDbCartProductOptionSearch(String productName, String optionName, String mid);

	public void dbShopCartUpdate(DbCartVO vo);

	public void dbShopCartInput(DbCartVO vo);

	public List<DbCartVO> getDbCartList(String mid);

	public DbOrderVO getOrderMaxIdx();

	public DbCartVO getCartIdx(int idx);

	public void setDbOrder(DbOrderVO vo);

	public void setDbCartDeleteAll(int idx);

	public void setDbBaesong(DbBaesongVO baesongVO);

	public void setMemberPointPlus(int point, String mid);

	public List<DbBaesongVO> getBaesongList(String mid);

	public List<DbProductVO> getProductItemSearch(String itemSearch);

	public int setProductDelete(String item);

	public int setAdminProductMainimageUpdate(int idx, MultipartFile fileInput);

	public int setAdminProductNameUpdate(int idx, String productNameUpdate);

	public int setAdminDetailUpdate(int idx, String productDetailUpdate);

	public int setAdminSalePriceUpdate(int idx, String salePriceUpdate);

	public int setAdminMainPriceUpdate(int idx, String mainPriceUpdate);

	public int setAdminProductDelUpdate(int idx, String productDelUpdate);

	public int setAdminSaleUpdate(int idx, String saleUpdate);

	public int setAdminSalePercentUpdate(int idx, String salePercentUpdate, String salePriceSalePercent);

	public int setadminContentImageUpdate(int idx, String content);

	public int setAdminOptionUpdate(int idx, String optionNameUpdate, String optionPriceUpdate);

	public int setAdminBrendUpdateUpdate(int productContentIdx, String productContentBrend,
			String productContentDisingenous, String productContentRecipe, String productContentSize);

	public int setAdminHomeSubTitle(String homeSubTitle, String homeSubTitleText);

	public List<DbBaesongVO> getDeliveryUpdate(String mid);

	public int setDeliveryUpdateMember(DbBaesongVO vo);

	public int setDeliveryUpdateAddress(String address, int idx);

	public List<DbBaesongVO> getDbBaesongListShow();

	public int setCustomerReturns(ReturnsVO vo);

	public int setAdminReturnReport(MultipartFile photo, ReturnsVO vo);

	public boolean toggleDibsRecipe(int idx, String mid);

	public List<DbProductVO> getLoveProductList(int startIndexNo, int pageSize, String part, String mid);

	public List<ReturnsVO> getMyClaimList(String mid);

	public List<DbProductVO> getProductBrendList(int startIndexNo, int pageSize, String part);

	public List<DbProductVO> getProductEventList(int startIndexNo, int pageSize, String part);


	int setIntairaStory(MultipartFile fSNAme, String posiction);

	public List<IntairastoryVO> getIntairastoryList();

	public int getIntairastoryPosiction(String posiction);

	public int setUpdateIntairaStory(MultipartFile fSNAme, String posiction);

	public List<CuponVO> getCuponList();

	public DbBaesongVO getReviewSerchProduct(int idx, String mid);

	public List<ReviewVO> getProductReviewList(int idx);	

	public void setProductStusUpdate(int productIdx);

	public void setBrendRepice(DbOrderVO orderVO);

	public BrendVO getBrendrecipe(DbOrderVO orderVO);

	public DbOrderVO getProductContentIdxShow(int productIdx);

	public DbBaesongVO getBaesongReturn(String returnCategoryCode);

	public int setBaesongStutesUpdate(String orderIdx);

	public int setReturnStutesUpdate(String orderIdx);

	public void setUpdateProductStock(List<DbOrderVO> orderVOS);



}
