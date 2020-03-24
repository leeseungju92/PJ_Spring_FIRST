package com.first.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public List<BoardDTO> boardList(String search_option,String keyword,String sort_option, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("sort_option",sort_option);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return bDao.boardList(map);
	}
	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return bDao.countArticle(map);
	}
	
	@Override
	public BoardDTO viewList(int bno) {
		return bDao.viewList(bno);
		
	}
	@Override
	public int drop(int bno) {
		// TODO Auto-generated method stub
		return bDao.drop(bno);
	}
	@Override
	public void increaseViewcnt(int bno, HttpSession session) {
		// TODO Auto-generated method stub
		
		long update_time=0;
		if(session.getAttribute("update_time_"+bno)!=null){
			update_time=(long) session.getAttribute("update_time_"+bno);
		}
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 5000) {
			bDao.increaseViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
	}
	

}
