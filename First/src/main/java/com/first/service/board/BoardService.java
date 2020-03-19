package com.first.service.board;

import java.util.List;

import com.first.domain.BoardDTO;


public interface BoardService {
	public List<BoardDTO> boardList(String search_option,String keyword,String sort_option, int start, int end);

	public int countArticle(String search_option, String keyword);
	
}
