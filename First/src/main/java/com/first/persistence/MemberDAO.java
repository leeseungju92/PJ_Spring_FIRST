package com.first.persistence;

import com.first.domain.MemberDTO;

public interface MemberDAO {
	public int idOverlap(String id);
	public int memInsert(MemberDTO mDto);
}
