package com.first.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first.domain.ReplyDTO;
import com.first.service.reply.ReplyServcie;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyServcie rService;
	
	@GetMapping("/list")
	public String list(int bno, Model model){
		 List<ReplyDTO> list=rService.list(bno);
		model.addAttribute("list", list);
		return "/board/commentlist";
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public void insert(ReplyDTO rDto) {
		log.info("**************************************************************************************************post: reply insert");
		log.info(rDto.toString());
		rService.replyInsert(rDto);
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public void delete(int rno , int bno){
		rService.replyDelete(rno,bno);
		
	}
}
