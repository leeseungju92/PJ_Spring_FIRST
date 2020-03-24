package com.first.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.first.domain.BoardDTO;


public interface BoardService {
	public List<BoardDTO> boardList(String search_option,String keyword,String sort_option, int start, int end);

	public int countArticle(String search_option, String keyword);

	public BoardDTO viewList(int bno);

	public int drop(int bno);

	public void increaseViewcnt(int bno, HttpSession session);

	
}
