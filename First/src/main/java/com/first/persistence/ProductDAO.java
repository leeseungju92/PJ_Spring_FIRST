package com.first.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.first.domain.ProductDTO;
@Repository
public interface ProductDAO {
//	@Select("SELECT COUNT(*) FROM tbl_pdt")
//	public int getCount();
//	
//	
//	public int getCount2();
	
	public List<ProductDTO> bestPdtList();

	

	public void addnews(ProductDTO pDto);
	
}
