package com.first.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.first.domain.BoardDTO;
import com.first.service.board.BoardService;
import com.first.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String list(
			@RequestParam(defaultValue="1") int curPage, 
			Model model){
		
		int count = bService.countArticle();
		
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		
		
		
		List<BoardDTO> list = bService.boardList(start, end);
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		model.addAttribute("map", map);
		return "board/list";
	}
}
