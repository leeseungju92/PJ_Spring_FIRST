package com.first.service.board;

import java.util.List;

import com.first.domain.BoardDTO;


public interface BoardService {
	public List<BoardDTO> boardList(int start, int end);

	public int countArticle();
	
}
