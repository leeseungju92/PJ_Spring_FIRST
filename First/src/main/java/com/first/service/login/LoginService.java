package com.first.service.login;

import javax.servlet.http.HttpSession;

import com.first.domain.MemberDTO;

public interface LoginService {
	
	public void logout();
	public int login(MemberDTO mDto, HttpSession session);
}
