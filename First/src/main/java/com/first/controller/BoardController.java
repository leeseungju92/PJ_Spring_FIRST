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
			@RequestParam(defaultValue="new") String sort_option,
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword,
			Model model){
		
		int count = bService.countArticle(search_option, keyword);
		
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		
		
		
		List<BoardDTO> list = bService.boardList(search_option,keyword,sort_option, start, end);
		for (BoardDTO boardDTO : list) {
			if(!(keyword=="")) {
				boardDTO.setWriter(boardDTO.getWriter().replaceAll(keyword, "<span id=search_bcc>"+keyword+"</span>"));
				
				
				boardDTO.setTitle(boardDTO.getTitle().replaceAll(keyword, "<span id=search_bcc>"+keyword+"</span>"));
			}
		}
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		model.addAttribute("map", map);
		return "board/list";
	}
}
