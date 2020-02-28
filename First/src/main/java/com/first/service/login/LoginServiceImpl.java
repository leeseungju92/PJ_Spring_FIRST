package com.first.service.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.first.domain.MemberDTO;
import com.first.persistence.LoginDAO;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class LoginServiceImpl implements LoginService{
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	private SqlSession sqlSession;
	
	private LoginDAO lDao;
	
	@Autowired
	public void newMemberDAO() {
		lDao = sqlSession.getMapper(LoginDAO.class);
	}
	
	@Override
	public int login(MemberDTO mDto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDTO loginDto = lDao.loginUser(mDto);
		log.info("*******************************************결과");
		int result =0;
		
		if(loginDto==null) {
			result = 0;
			return result;
		}
		if(!(loginDto.getUseyn().equals("y"))) {
			result = 2;
			return result;
		}	
		if(loginDto != null) {
			if(passwordEncoder.matches(mDto.getPw(), loginDto.getPw())) {
				result = 1;
				session.removeAttribute("userid");
				session.removeAttribute("name");
				session.setAttribute("userid", loginDto.getId());
				session.setAttribute("name", loginDto.getName());
			}else {
				result = 3;
			}
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	


}
