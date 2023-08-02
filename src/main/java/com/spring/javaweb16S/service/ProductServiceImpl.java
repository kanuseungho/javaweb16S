package com.spring.javaweb16S.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaweb16S.common.JavawebProvide;
import com.spring.javaweb16S.dao.ProductDAO;
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

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDAO productDAO;

	@Override
	public List<DbProductVO> getProductList(int startIndexNo, int pageSize, String part) {
		return productDAO.getProductList(startIndexNo,pageSize ,part);
	}

	@Override
	public DbProductVO getDbShopProduct(int idx) {
		// TODO Auto-generated method stub
		return productDAO.getDbShopProduct(idx);
	}

	@Override
	public List<DbOptionVO> getDbShopOption(int productIdx) {
		// TODO Auto-generated method stub
		return productDAO.getDbShopOption(productIdx);
	}

	@Override
	public DbProductVO getProductDetailedShow(int idx) {
		// TODO Auto-generated method stub
		return productDAO.getProductDetailedShow(idx);
	}

	@Override
	public List<DbOptionVO> getDbShopOptionShow(int idx) {
		return productDAO.getDbShopOptionShow(idx);
	}

	@Override
	public DbCartVO getDbCartProductOptionSearch(String productName, String optionName, String mid) {
		// TODO Auto-generated method stub
		return productDAO.getDbCartProductOptionSearch(productName, optionName, mid);
	}

	@Override
	public void dbShopCartUpdate(DbCartVO vo) {
		productDAO.dbShopCartUpdate(vo);
		
	}

	@Override
	public void dbShopCartInput(DbCartVO vo) {
		productDAO.dbShopCartInput(vo);
		
	}

	@Override
	public List<DbCartVO> getDbCartList(String mid) {	
		return productDAO.getDbCartList(mid);
	}

	@Override
	public DbOrderVO getOrderMaxIdx() {
		// TODO Auto-generated method stub
		return productDAO.getOrderMaxIdx();
	}

	@Override
	public DbCartVO getCartIdx(int idx) {
		// TODO Auto-generated method stub
		return productDAO.getCartIdx(idx);
	}

	@Override
	public void setDbOrder(DbOrderVO vo) {
		productDAO.setDbOrder(vo);
		
	}

	@Override
	public void setDbCartDeleteAll(int idx) {
		productDAO.setDbCartDeleteAll(idx);
		
	}

	@Override
	public void setDbBaesong(DbBaesongVO baesongVO) {
		productDAO.setDbBaesong(baesongVO);
		
	}

	@Override
	public void setMemberPointPlus(int point, String mid) {
		productDAO.setMemberPointPlus(point,mid);
		
	}

	@Override
	public List<DbBaesongVO> getBaesongList(String mid) {		
		return productDAO.getBaesongList(mid) ;
	}

	@Override
	public List<DbProductVO> getProductItemSearch(String itemSearch) {
		// TODO Auto-generated method stub
		return productDAO.getProductItemSearch(itemSearch);
	}

	@Override
	public int setProductDelete(String item) {
		// TODO Auto-generated method stub
		return productDAO.setProductDelete(item);
	}

	@Override
	public int setAdminProductMainimageUpdate(int idx, MultipartFile fileInput) {
		int res = 0;
	    DbProductVO vo = new DbProductVO();
	    try {
	        String oFileName = fileInput.getOriginalFilename();
	        
	        if (oFileName.equals("")) {
	            vo.setFSName ("noimage.jpg");
	        } 
	        else {
	            UUID uid = UUID.randomUUID();
	            String saveFileName = uid + "_" + oFileName;
	            JavawebProvide jp = new JavawebProvide(); // 수정: 객체 생성 부분
	            jp.writeFile(fileInput, saveFileName, "dbShop/product");
	            
	            vo.setFSName(saveFileName);
	        }
	        //adminDAO.setUploadOk(vo,imageFile);
	        productDAO.setUploadOk(vo,idx);
	        res = 1;
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    res=1;
	    return res;
	}

	@Override
	public int setAdminProductNameUpdate(int idx, String productNameUpdate) {
		// TODO Auto-generated method stub
		return productDAO.setAdminProductNameUpdate(idx, productNameUpdate);
	}

	@Override
	public int setAdminDetailUpdate(int idx, String productDetailUpdate) {
		// TODO Auto-generated method stub
		return productDAO.setAdminDetailUpdate(idx,productDetailUpdate);
	}

	@Override
	public int setAdminSalePriceUpdate(int idx, String salePriceUpdate) {
		// TODO Auto-generated method stub
		return productDAO.setAdminSalePriceUpdate(idx,salePriceUpdate);
	}

	@Override
	public int setAdminMainPriceUpdate(int idx, String mainPriceUpdate) {
		// TODO Auto-generated method stub
		return productDAO.setAdminMainPriceUpdate(idx,mainPriceUpdate);
	}

	@Override
	public int setAdminProductDelUpdate(int idx, String productDelUpdate) {
		// TODO Auto-generated method stub
		return productDAO.setAdminProductDelUpdate(idx, productDelUpdate);
	}

	@Override
	public int setAdminSaleUpdate(int idx, String saleUpdate) {
		// TODO Auto-generated method stub
		return productDAO.setAdminSaleUpdate(idx, saleUpdate);
	}

	@Override
	public int setAdminSalePercentUpdate(int idx, String salePercentUpdate,String mainPriceSalePercent) {
	    int salePrice = Integer.parseInt(mainPriceSalePercent) - (Integer.parseInt(mainPriceSalePercent) * Integer.parseInt(salePercentUpdate) / 100);	  
	    return productDAO.setAdminSalePercentUpdate(idx,salePercentUpdate, salePrice,mainPriceSalePercent); 
	}

	@Override
	public int setadminContentImageUpdate(int idx, String content) {		
		if(content.indexOf("src=\"/") == -1) return 0;		// content박스의 내용중 그림이 없으면 돌아간다.
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		// String uploadPath = request.getRealPath("/resources/data/dbShop/");
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/");
		
		int position = 29;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile;	// 원본 그림이 들어있는 '경로명+파일명'
			
			copyFilePath = uploadPath + "product/" + imgFile;	// 복사가 될 '경로명+파일명'
			
			fileCopyCheck(oriFilePath, copyFilePath);	// 원본그림이 복사될 위치로 복사작업처리하는 메소드
			
			if(nextImg.indexOf("src=\"/") == -1) sw = false;
			else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
		// 이미지 복사작업이 종료되면 실제로 저장된 'dbShop/product'폴더명을 vo에 set시켜줘야 한다.
		content.replace("/data/dbShop/", "/data/dbShop/product/");

		// 파일 복사작업이 모두 끝나면 vo에 담긴내용을 상품의 내역을 DB에 저장한다.
		// 먼저 productCode를 만들어주기 위해 지금까지 작업된 dbProduct테이블의 idx필드중 최대값을 읽어온다. 없으면 0으로 처리한다.
		int maxIdx = 1;
		DbProductVO maxVo = productDAO.getProductMaxIdx();
		if(maxVo != null) {
			maxIdx = maxVo.getIdx() + 1;			
		}						
		productDAO.setDbProductInput(content,maxIdx,idx);
		return 1;
	}
	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		
		try {
			FileInputStream  fis = new FileInputStream(oriFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			
			byte[] buffer = new byte[2048];
			int count = 0;
			while((count = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, count);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int setAdminOptionUpdate(int idx, String optionNameUpdate, String optionPriceUpdate) {
		// TODO Auto-generated method stub
		return productDAO.setAdminOptionUpdate(idx, optionNameUpdate, optionPriceUpdate);
	}

	@Override
	public int setAdminBrendUpdateUpdate(int productContentIdx, String productContentBrend,
			String productContentDisingenous, String productContentRecipe, String productContentSize) {
		// TODO Auto-generated method stub
		return productDAO.setAdminBrendUpdateUpdate(productContentIdx,productContentBrend,productContentDisingenous,productContentRecipe,productContentSize);
	}

	@Override
	public int setAdminHomeSubTitle(String homeSubTitle, String homeSubTitleText) {
			System.out.println("homeSubTitle"+homeSubTitle);
			System.out.println("homeSubTitleText"+homeSubTitleText);
			int res = productDAO.getAdminHomeSubTitleShow(homeSubTitle);
			System.out.println("res : "+res);
			if(res==1) {
				return productDAO.setAdminHomeSubTitleUpdate(homeSubTitle,homeSubTitleText);
			}
			else {
				return productDAO.setAdminHomeSubTitle(homeSubTitle,homeSubTitleText);
			}
		
	}

	@Override
	public List<DbBaesongVO> getDeliveryUpdate(String mid) {
		// TODO Auto-generated method stub
		return productDAO.getDeliveryUpdate(mid);
	}

	@Override
	public int setDeliveryUpdateMember(DbBaesongVO vo) {
		// TODO Auto-generated method stub
		return productDAO.setDeliveryUpdateMember(vo);
	}

	@Override
	public int setDeliveryUpdateAddress(String address,int idx) {
		// TODO Auto-generated method stub
		return productDAO.setDeliveryUpdateAddress(address,idx);
	}

	@Override
	public List<DbBaesongVO> getDbBaesongListShow() {
		// TODO Auto-generated method stub
		return productDAO.getDbBaesongListShow();
	}

	@Override
	public int setCustomerReturns(ReturnsVO vo) {
		// TODO Auto-generated method stub
		return productDAO.setCustomerReturns(vo);
	}

	@Override
	public int setAdminReturnReport(MultipartFile photo, ReturnsVO vo) {
		int res = 0;
		
		try {
			String oFileName = photo.getOriginalFilename();
			
			if(oFileName.equals("")) {
				vo.setFName("noimage.jpg");  
			}
			else {
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" + oFileName;
				
				JavawebProvide jp = new JavawebProvide();
				jp.writeFile(photo, saveFileName, "member");
				
				vo.setFName(saveFileName);
			}
			productDAO.setAdminReport(vo);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public boolean toggleDibsRecipe(int idx, String mid) {
		boolean isDibs = productDAO.productLikeCheck(idx, mid);
	      System.out.println(isDibs);
	    if (isDibs) {
	    	productDAO.deleteListGood(idx, mid);
	    } else {
	    	productDAO.insertListGood(idx, mid);
	    }
	    return !isDibs;
	}

	@Override
	public List<DbProductVO> getLoveProductList(int startIndexNo, int pageSize, String part, String mid) {
		// TODO Auto-generated method stub
		return productDAO.getLoveProductList(startIndexNo, pageSize,part,mid);
	}

	@Override
	public List<ReturnsVO> getMyClaimList(String mid) {

		return productDAO.getMyClaimList(mid);
	}

	@Override
	public List<DbProductVO> getProductBrendList(int startIndexNo, int pageSize, String part) {
		// TODO Auto-generated method stub
		return productDAO.getProductBrendList(startIndexNo, pageSize, part);
	}

	@Override
	public List<DbProductVO> getProductEventList(int startIndexNo, int pageSize, String part) {
		// TODO Auto-generated method stub
		return productDAO.getProductEventList(startIndexNo,pageSize,part);
	}

	@Override
	public int setIntairaStory(MultipartFile fSNAme, String posiction) {
	int res = 0;
	    
	    try {
	        String oFileName = fSNAme.getOriginalFilename();
	        
            UUID uid = UUID.randomUUID();
            String saveFileName = uid + "_" + oFileName;
            JavawebProvide jp = new JavawebProvide(); // 수정: 객체 생성 부분
            jp.writeFile(fSNAme, saveFileName, "magagin");                            
            productDAO.setIntariaUploadUpdateOk(posiction, saveFileName);
	        res = 1;
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    res=1;
	    return res;		
	}

	@Override
	public List<IntairastoryVO> getIntairastoryList() {
		// TODO Auto-generated method stub
		return productDAO.getIntairastoryList();
	}

	@Override
	public int getIntairastoryPosiction(String posiction) {
		// TODO Auto-generated method stub
		return productDAO. getIntairastoryPosiction( posiction);
	}

	@Override
	public int setUpdateIntairaStory(MultipartFile fSNAme, String posiction) {
int res = 0;
	    
	    try {
	        String oFileName = fSNAme.getOriginalFilename();
	        
            UUID uid = UUID.randomUUID();
            String saveFileName = uid + "_" + oFileName;
            JavawebProvide jp = new JavawebProvide(); // 수정: 객체 생성 부분
            jp.writeFile(fSNAme, saveFileName, "magagin");                            
            productDAO.setIntariaUpdateOk(posiction, saveFileName);
	        res = 1;
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    res=1;
	    return res;		
	}

	@Override
	public List<CuponVO> getCuponList() {
		// TODO Auto-generated method stub
		return productDAO.getCuponList();
	}

	@Override
	public DbBaesongVO getReviewSerchProduct(int idx, String mid) {
		// TODO Auto-generated method stub
		return productDAO.getReviewSerchProduct(idx,mid);
	}

	@Override
	public List<ReviewVO> getProductReviewList(int idx) {
		// TODO Auto-generated method stub
		return productDAO.getProductReviewList(idx);
	}


	@Override
	public void setProductStusUpdate(int productIdx) {
		productDAO.setProductStusUpdate(productIdx);
		
	}

	@Override
	public void setBrendRepice(DbOrderVO orderVO) {
		productDAO.setBrendRepice(orderVO);
		
	}

	@Override
	public BrendVO getBrendrecipe(DbOrderVO orderVO) {
		// TODO Auto-generated method stub
		return productDAO.getBrendrecipe(orderVO);
	}

	@Override
	public DbOrderVO getProductContentIdxShow(int productIdx) {
		// TODO Auto-generated method stub
		return productDAO.getProductContentIdxShow(productIdx);
	}

	@Override
	public DbBaesongVO getBaesongReturn(String returnCategoryCode) {
		// TODO Auto-generated method stub
		return productDAO.getBaesongReturn(returnCategoryCode);
	}

	@Override
	public int setBaesongStutesUpdate(String orderIdx) {
		// TODO Auto-generated method stub
		return productDAO.setBaesongStutesUpdate(orderIdx);
	}

	@Override
	public int setReturnStutesUpdate(String orderIdx) {
		// TODO Auto-generated method stub
		return productDAO.setReturnStutesUpdate(orderIdx);
	}

	@Override
	public void setUpdateProductStock(List<DbOrderVO> orderVOS) {
		productDAO.setUpdateProductStock(orderVOS);
		
	}




}
