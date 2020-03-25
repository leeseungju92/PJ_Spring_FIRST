package com.first.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.first.domain.ReplyDTO;

public interface ReplyDAO {

	public List<ReplyDTO> list(int bno);

}
