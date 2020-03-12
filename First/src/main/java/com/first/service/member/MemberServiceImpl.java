package com.first.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.first.domain.MemberDTO;
import com.first.persistence.MemberDAO;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
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

	@Override
	public int pwCheck(String id, String pw) {
		// TODO Auto-generated method stub
		String encPW = mDao.pwCheck(id);
		
		int result=0;
		if(passwordEncoder.matches(pw,encPW)) {
			result=1;
		}
		
		
		
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		// TODO Auto-generated method stub
		mDao.pwUpdate(mDto);
	}

	@Override
	public void memDrop(HttpSession session, String id) {
		// TODO Auto-generated method stub		
		int result = mDao.memDrop(id);
		if(result ==1) {
			session.invalidate();			
		}
	}

}
