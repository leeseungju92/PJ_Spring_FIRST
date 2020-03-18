package com.first.service.board;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.BoardDTO;
import com.first.persistence.BoardDAO;


import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private SqlSession sqlSession;
	
	BoardDAO bDao;
	@Autowired
	public void boardListDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	@Override
	public List<BoardDTO> boardList() {
		List<BoardDTO> list=bDao.boardList();
		for (BoardDTO boardDTO : list) {
			log.info(boardDTO.toString());
			
		}
		return bDao.boardList();
	}

}
