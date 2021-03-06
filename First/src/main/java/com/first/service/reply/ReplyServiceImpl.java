package com.first.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.ReplyDTO;

import com.first.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyServcie {
	
	private ReplyDAO rDao;
	@Autowired
	private SqlSession sqlSession;
	
	
	@Autowired
	public void boardListDAO() {
		rDao = sqlSession.getMapper(ReplyDAO.class);
	}
	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return rDao.list(bno);
	}
	@Transactional
	@Override
	public void replyInsert(ReplyDTO rDto) {
		// TODO Auto-generated method stub
		String type = "plus";
		rDao.replyCntUpdate(rDto.getBno(),type);
		
		rDao.replyInsert(rDto);
	}
	@Transactional
	@Override
	public void replyDelete(int rno, int bno) {
		// TODO Auto-generated method stub
		String type = "minus";
		rDao.replyDelete(rno);
		rDao.replyCntUpdate(bno,type);
	}

}
