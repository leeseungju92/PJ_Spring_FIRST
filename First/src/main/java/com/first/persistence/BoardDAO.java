package com.first.persistence;

import java.util.List;

import com.first.domain.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> boardList();
}
