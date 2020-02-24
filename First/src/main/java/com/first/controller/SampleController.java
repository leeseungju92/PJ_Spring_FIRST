package com.first.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;
//lombok 라이브러리의 log기능 사용
@Slf4j
//Spring이 동작시 DispathcerServlet 생성과정에서 
//servlet-context.xml의 환경설정을 읽어들이는데
//servlet-context.xml 내의 componet-scan이 설정된 경로를 돌아다니면서 @Controller가 붙어있는
//Class들을 전부 Spring Context에 Beans로 등록 시켜 사용하기 위해
//Spring Context에 Beans로 등록되있어야
//DispatcherServlet이 Handler Mapping과 Adapter를 통해 요청처리를 시킬수 있음.

//Spring Context에 Beans로 등록되었다 = Springdl 객체의 제어권을 개발자로부터 넘겨받음(IOC패턴)

//Spring Context에 Beans로 등록되어있는 객체들만 의존성 주입 가능 (DI패턴)
@RequestMapping("/sample")
@Controller
public class SampleController {
	@RequestMapping("/")
	public String viewSample() {
		log.info("Get 방식 호출");
		return "sample";		
	}
//	@RequestMapping(value="/sample/view", method=RequestMethod.GET)
	@GetMapping("/view")
	public String view(String user) {
		log.info("Get 방식 호출");
		log.info("user:"+user);
		return "result";		
	}
	
//	@PostMapping("/view")
//	public String view(String user) {
//		log.info("Post 방식 호출");
//		return "result";		
//	}
	
	
	//public String view(HttpServletRequest request) 매개변수에 @RequestParam @RequestParam 생략가능 
	@PostMapping("/view")
	public String view(SampleDTO sDto) {
//		String user = request.getParameter("user"); 값을 모두 스트링타입으로 받음 개발자가 받아서 형변환하는 작업이 필수!
//		String pass = request.getParameter("pass");	현재는 매개변수에 타입 지정시 형변환까지해서 값을 저장해줌 스프링이.
//		null값이 들어오면 하단 매개변수를 사용하는 부분 전부 error > Null체크 코드 필수 ! 현재는 널체크까지 해줌.
		log.info("Post방식호출");
//		log.info(user+","+pass);
		log.info(sDto.toString());
		
		return "result";
	}
	@GetMapping("/sync")
	public String sync(String name, Model model) {
		log.info("동기방식"+name);
		model.addAttribute("name", name);
		return "sample";
	}
	@ResponseBody
	@PostMapping(value="/ajax", produces="application/text;charset=utf-8")
	public String async(String name) {
		log.info("비동기방식" + name);		
		return name;
	}
}
