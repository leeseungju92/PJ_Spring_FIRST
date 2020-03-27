package com.first.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.first.domain.ReplyDTO;

public interface ReplyDAO {

	public List<ReplyDTO> list(int bno);

	public void replyInsert(ReplyDTO rDto);

	public void replyCntPlus(ReplyDTO rDto);

	public void replyDelete(@Param("rno") int rno);

	public void replyCntUpdate(@Param("bno")int bno,@Param("type") String type);

}
