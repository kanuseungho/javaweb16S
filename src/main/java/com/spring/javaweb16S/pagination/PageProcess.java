package com.spring.javaweb16S.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaweb16S.dao.MemberDAO;
import com.spring.javaweb16S.dao.ProductDAO;
@Service
public class PageProcess {

	
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	ProductDAO productDAO;

	
	
	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		if(section.equals("member")) {
			totRecCnt = memberDAO.totRecCnt(searchString);
		}
		else if(section.equals("product")) {
			totRecCnt = productDAO.totRecCnt();
		}
		else if(section.equals(section)) {
			totRecCnt = productDAO.partRecCnt(section);
		}

		
		
		
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt /pageSize : (totRecCnt / pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setCurBlock(curBlock);
		pageVO.setBlockSize(blockSize);
		pageVO.setLastBlock(lastBlock);
		pageVO.setPart(part);
		
		return pageVO;
	}
}
