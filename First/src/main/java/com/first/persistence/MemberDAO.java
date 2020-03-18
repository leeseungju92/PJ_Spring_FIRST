package com.first.persistence;

import com.first.domain.MemberDTO;

public interface MemberDAO {	
	public int idOverlap(String id);
	public int memInsert(MemberDTO mDto);
	public int getKey(String id , String key);
	public int alterKey(String id, String key);
	public MemberDTO userView(String id);
	public String pwCheck(String id);
	public void pwUpdate(MemberDTO mDto);
	public int memDrop(String id);
	public int memUpdate(MemberDTO mDto);
}
