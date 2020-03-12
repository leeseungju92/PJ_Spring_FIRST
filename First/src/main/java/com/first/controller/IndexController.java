package com.first.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.first.domain.ProductDTO;
import com.first.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	@Autowired
	IndexService iservice;
	@RequestMapping("/")	
	public String indexView(Model model, HttpSession session) {
		log.info(">>>>>INDEX PAGE 출력");
			
		List<ProductDTO> list = iservice.bestPdtList();
		
		model.addAttribute("BestPdt" , iservice.bestPdtList());
		
		//개발종료시 삭제할것
//		session.removeAttribute("userid");
//		session.removeAttribute("name");
//		session.setAttribute("userid", "admin12");
//		session.setAttribute("name", "aA13241324!");
		
		return "index";
	}	
}

