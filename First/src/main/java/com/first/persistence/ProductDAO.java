package com.first.persistence;

import java.util.List;

import com.first.domain.ProductDTO;

public interface ProductDAO {
//	@Select("SELECT COUNT(*) FROM tbl_pdt")
//	public int getCount();
//	
//	
//	public int getCount2();
	
	public List<ProductDTO> bestPdtList();
	
}
