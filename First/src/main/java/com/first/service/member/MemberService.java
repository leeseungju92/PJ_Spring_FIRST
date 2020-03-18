package com.first.service.member;

import javax.servlet.http.HttpSession;

import com.first.domain.MemberDTO;

public interface MemberService {
	public int idOverlap(String id);
	public int memInsert(MemberDTO mDto);	
	public MemberDTO userView(String id);
	public int pwCheck(String id, String pw);
	public void pwUpdate(MemberDTO mDto);
	public void memDrop(HttpSession session, String id);
	public void memUpdate(MemberDTO mDto, HttpSession session);
	
}
