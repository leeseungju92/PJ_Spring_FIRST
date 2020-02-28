package com.first.service.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.MemberDTO;
import com.first.persistence.MemberDAO;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	@Override
	public int idOverlap(String id) {
		// TODO Auto-generated method stub
		return mDao.idOverlap(id);
	}

	@Override
	public int memInsert(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return mDao.memInsert(mDto);
	}

	@Override
	public MemberDTO userView(String id) {
		
		return mDao.userView(id);
	}

}
