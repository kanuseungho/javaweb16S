package com.spring.javaweb16S.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

public interface ProductDAO {

	public List<DbProductVO> getProductList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize, @Param("part") String part);

	public int totRecCnt();

	public DbProductVO getDbShopProduct(@Param("idx")int idx);

	public List<DbOptionVO> getDbShopOption(@Param("productIdx")int idx);

	public DbProductVO getProductDetailedShow(@Param("idx") int idx);

	public List<DbOptionVO> getDbShopOptionShow(@Param("idx")int idx);

	public DbCartVO getDbCartProductOptionSearch(@Param("productName") String productName, @Param("optionName") String optionName, @Param("mid") String mid);

	public void dbShopCartUpdate(@Param("vo") DbCartVO vo);

	public void dbShopCartInput(@Param("vo") DbCartVO vo);

	public List<DbCartVO> getDbCartList(@Param("mid") String mid);

	public DbOrderVO getOrderMaxIdx();

	public DbCartVO getCartIdx(@Param("idx") int idx);

	public void setDbOrder(@Param("vo") DbOrderVO vo);

	public void setDbCartDeleteAll(@Param("idx") int idx);

	public void setDbBaesong(@Param("baesongVO")DbBaesongVO baesongVO);

	public void setMemberPointPlus(@Param("point") int point,  @Param("mid")String mid);

	public List<DbBaesongVO> getBaesongList(@Param("mid") String mid);

	public List<DbProductVO> getProductItemSearch(@Param("itemSearch")String itemSearch);

	public int setProductDelete(@Param("item")String item);

	public void setUploadOk(@Param ("vo")DbProductVO vo,@Param("idx") int idx);

	public int setAdminProductNameUpdate(@Param("idx") int idx,@Param("productNameUpdate") String productNameUpdate);

	public int setAdminDetailUpdate(@Param("idx")int idx,@Param("productDetailUpdate") String productDetailUpdate);

	public int setAdminSalePriceUpdate( @Param("idx") int idx, @Param("salePriceUpdate") String salePriceUpdate);

	public int setAdminMainPriceUpdate(@Param("idx")int idx,@Param("mainPriceUpdate") String mainPriceUpdate);

	public int setAdminProductDelUpdate(@Param("idx") int idx, @Param("productDelUpdate") String productDelUpdate);

	public int setAdminSaleUpdate(@Param("idx") int idx,@Param("saleUpdate") String saleUpdate);

	public int setAdminSalePercentUpdate( @Param("idx") int idx, @Param("salePercentUpdate") String salePercentUpdate);

	public int setAdminSalePercentUpdate(@Param("idx") int idx, @Param("salePercentUpdate") String salePercentUpdate,@Param("salePrice") int salePrice,@Param("mainPriceSalePercent") String mainPriceSalePercent);

	public DbProductVO getProductMaxIdx();

	public void setDbProductInput(@Param("content")String content,@Param("maxIdx") int maxIdx,@Param("idx") int idx);

	public int setAdminOptionUpdate(@Param("idx") int idx, @Param("optionNameUpdate") String optionNameUpdate, @Param("optionPriceUpdate") String optionPriceUpdate);

	public int setAdminBrendUpdateUpdate(@Param("productContentIdx") int productContentIdx,@Param("productContentBrend") String productContentBrend,
			@Param("productContentDisingenous") String productContentDisingenous,@Param("productContentRecipe") String productContentRecipe,@Param("productContentSize") String productContentSize);

	public int setAdminHomeSubTitle(@Param("homeSubTitle")String homeSubTitle,@Param("homeSubTitleText") String homeSubTitleText);

	public List<DbBaesongVO> getDeliveryUpdate(@Param("mid")String mid);

	public int setDeliveryUpdateMember(@Param("vo")DbBaesongVO vo);

	public int setDeliveryUpdateAddress(@Param("address") String address,@Param("idx") int idx);

	public List<DbBaesongVO> getDbBaesongListShow();

	public int setCustomerReturns(@Param("vo")ReturnsVO vo);

	public void setAdminReport( @Param("vo") ReturnsVO vo);

	public int getAdminHomeSubTitleShow(@Param("homeSubTitle")String homeSubTitle);

	public int setAdminHomeSubTitleUpdate(@Param("homeSubTitle")String homeSubTitle,@Param("homeSubTitleText") String homeSubTitleText);

	public boolean productLikeCheck(@Param("idx")int idx,@Param("mid") String mid);

	public void deleteListGood(@Param("idx")int idx,@Param("mid") String mid);

	public void insertListGood(@Param("idx")int idx,@Param("mid") String mid);

	public List<DbProductVO> getLoveProductList(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize,@Param("part") String part,@Param("mid") String mid);

	public List<ReturnsVO> getMyClaimList(@Param("mid")String mid);

	public List<DbProductVO> getProductBrendList(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize,@Param("part") String part);

	public List<DbProductVO> getProductEventList(@Param("startIndexNo")int startIndexNo, @Param("pageSize")int pageSize,@Param("part") String part);

	public void setIntariaUploadUpdateOk(@Param("posiction")String posiction,@Param("saveFileName") String saveFileName);

	public List<IntairastoryVO> getIntairastoryList();

	public int getIntairastoryPosiction(@Param("posiction")String posiction);

	public void setIntariaUpdateOk(@Param("posiction")String posiction,@Param("saveFileName") String saveFileName);

	public List<CuponVO> getCuponList();

	public DbBaesongVO getReviewSerchProduct(@Param("idx")int idx,@Param("mid") String mid);

	public List<ReviewVO> getProductReviewList(@Param("idx") int idx);

	public void setBrendRepice(@Param("vo")DbCartVO vo);

	public BrendVO getBrendrecipe(@Param("vo") DbCartVO vo);

	public void setProductStusUpdate(@Param("productIdx")int productIdx);

	public void setBrendRepice(@Param("orderVO") DbOrderVO orderVO);

	public BrendVO getBrendrecipe(@Param("orderVO") DbOrderVO orderVO);

	public DbOrderVO getProductContentIdxShow(@Param("productIdx")int productIdx);

	public int partRecCnt(@Param("section")String section);

	public DbBaesongVO getBaesongReturn(@Param("returnCategoryCode")String returnCategoryCode);

	public int setBaesongStutesUpdate(@Param("orderIdx")String orderIdx);

	public int setReturnStutesUpdate(@Param("orderIdx")String orderIdx);

	public void setUpdateProductStock(@Param("orderVOS") List<DbOrderVO> orderVOS);





	

	

}
