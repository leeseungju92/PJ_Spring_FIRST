package com.first.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
			Model model,
			HttpSession session){
		
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
	
	@GetMapping("/viewList/{bno}")
	public String viewList(HttpSession session,@PathVariable(value="bno") int bno, Model model) {		
		bService.increaseViewcnt(bno,session);
		HashMap<String, Object> map = new HashMap<>();
		map.put("bDto", bService.viewList(bno));
		
		model.addAttribute("map", map);
		model.addAttribute("key", "dropBoard");
		return "board/viewList";
	}
	@GetMapping("/drop")
	public String drop(int bno) {
		
		bService.drop(bno);
		return "redirect:/board/list";
	}
	@GetMapping("/write")
	public String insert() {

		return "board/register";
	}
	@PostMapping("/write")
	public String write(BoardDTO bDto, Model model) {
		log.info("POST>로ㅏ이트");
		bService.write(bDto);
		
		
		return "redirect:/board/viewList/"+bDto.getBno();
	}
	@GetMapping("/update")
	public String updateBoard(int bno, Model model) {
		model.addAttribute("one", bService.viewList(bno));
		return "/board/register";
	}
	@PostMapping("/update")
	public String updateBoard(BoardDTO bDto,Model model) {
		bService.update(bDto);
		
		
		return "redirect:/board/viewList/"+bDto.getBno();
	}
}
