package com.first.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userid")==null) {
			log.info("NOLOGIN");
			String referer = request.getHeader("referer");
			
			String uri = request.getRequestURI();
			log.info(uri);
			if(referer==null) {
				referer = "http://localhost:8081/first";
			}else {
				log.info("이전url"+referer);
				int index = referer.lastIndexOf("/");
				int len = referer.length();
				log.info("인덱스"+index);
				log.info("길이"+len);
				String mapWord =referer.substring(index, len);
				log.info("수정url"+mapWord);
				
				if(mapWord.equals("/write")) {
					response.sendRedirect(request.getContextPath()+"/board/list");
					return false;
				}
			}
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			fMap.put("uri", uri);
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			
			response.sendRedirect(referer);
			
			return false;
			}else {
			log.info("LOGIN:)");
			return true;
			}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
