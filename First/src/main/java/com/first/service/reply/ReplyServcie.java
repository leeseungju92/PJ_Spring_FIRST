package com.first.service.reply;

import java.util.List;

import com.first.domain.ReplyDTO;

public interface ReplyServcie {

	public List<ReplyDTO> list(int bno);

	public void replyInsert(ReplyDTO rDto);

	public void replyDelete(int rno, int bno);

}
