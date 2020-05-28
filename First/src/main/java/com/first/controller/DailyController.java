package com.first.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.first.domain.DailyDTO;
import com.first.service.daily.DailyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/daily")
public class DailyController {
	//조회 등록 수정 삭제
	@Autowired
	DailyService ds;
	
	@GetMapping("/create")
	public String create(DailyDTO dDto) {
		log.info(dDto.toString());
		ds.dc(dDto);
		return "redirect:/";		
	}
	@GetMapping("/read")
	public void read() {
		ds.dr();
	}
	@PostMapping("/update")
	public void update() {
		ds.du();
	}
	@GetMapping("/delete")
	public void delete() {
		ds.dd();
	}
	

}
