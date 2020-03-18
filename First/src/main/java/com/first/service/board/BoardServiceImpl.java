package com.first.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<BoardDTO> boardList(int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return bDao.boardList(map);
	}
	@Override
	public int countArticle() {
		// TODO Auto-generated method stub
		return bDao.countArticle();
	}

}
