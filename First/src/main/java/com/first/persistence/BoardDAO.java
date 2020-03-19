package com.first.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.first.domain.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> boardList(@Param("map") Map<String,Object> map);

	public int countArticle(@Param("map") Map<String, String> map);
}
