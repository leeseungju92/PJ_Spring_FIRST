package com.first.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.first.domain.BoardDTO;
import com.first.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String list(Model model){
		List<BoardDTO> list = bService.boardList();
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		model.addAttribute("map", map);
		return "board/list";
	}
}
