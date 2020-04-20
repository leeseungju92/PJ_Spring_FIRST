package com.first.service.index;

import java.io.IOException;
import java.util.List;

import com.first.domain.ProductDTO;

public interface IndexService {
	public List<ProductDTO> bestPdtList();
	public void addNews() throws IOException;
	
	
}