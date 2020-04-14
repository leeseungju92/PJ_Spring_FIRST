package com.first.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.first.domain.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> boardList(@Param("map") Map<String,Object> map);

	public int countArticle(@Param("map") Map<String, String> map);

	public BoardDTO viewList(int bno);

	public int drop(int bno);

	public void increaseViewcnt(@Param("bno")int bno);

	public void write(BoardDTO bDto);

	public void update(BoardDTO bDto);

	public void answer(BoardDTO bDto);

	public void update_step(BoardDTO bDto);

	public void addAttach(@Param("fullName")String fullName);

	public List<String> getAttach(@Param("bno")int bno);

	public void deleteAttach(int bno);

	public void updateAttach(@Param("fullName")String fullName, @Param("bno")int bno);

	

	
}
