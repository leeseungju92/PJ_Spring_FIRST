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
		String referer = request.getHeader("referer");
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();		
		String nextUrl = uri.substring(ctx.length());
		String prevUrl = "";
		String finalUrl ="http://localhost:8081/first/";
		String qString = request.getQueryString();
		if(referer == null) {
			response.sendRedirect(finalUrl);
			return false;
		}else {
			int indexQuery = referer.indexOf("?");
			if(indexQuery == -1) {
				prevUrl = referer.substring(finalUrl.length()-1);
			}else {
				prevUrl = referer.substring(finalUrl.length()-1,indexQuery);
			}
			if(nextUrl.equals("/board/update")||nextUrl.equals("/board/delete")||nextUrl.equals("/board/answer")) {
				if(request.getParameter("title")==null) {
					if(prevUrl.indexOf("board/viewList")==-1) {
						response.sendRedirect(finalUrl);
						return false;
					}
				}
			}
		}
				
		if(session.getAttribute("userid")==null) {			
			if(prevUrl.equals(nextUrl)) {
				response.sendRedirect(finalUrl);
				return false;
			}
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			if(qString!=null) {
				uri = uri +"?"+ qString;
			}
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
