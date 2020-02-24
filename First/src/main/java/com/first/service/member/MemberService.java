package com.first.service.member;

import com.first.domain.MemberDTO;

public interface MemberService {
	public int idOverlap(String id);
	public int memInsert(MemberDTO mDto);
}
