package com.first.service.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.first.persistence.MemberDAO;


@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
	JavaMailSender mailSender;
	
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if((num>=48&&num<=57)||(num>=65&&num<=90)||(num>=97&&num<=122)) {
				sb.append((char)num);
			}else {
				continue;
			}
		}while(sb.length() < size);
			if(lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();	
		}
		private boolean lowerCheck;
		private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	@Override
	public void mailSendUser(String email, String id, HttpServletRequest request) {
		String key = getKey(false,20);
		mDao.getKey(id,key);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlTxt = "<h2> 안녕하세요 first입니다:)</h2><br><br>"+
						"<h3>"+id+"님</h3>"+"<p>인증하기 버튼을 누르시면 first 사이트 활동이 가능합니다."
						+"<a href='http://localhost:8081" + request.getContextPath() + "/member/keyauth?id=" + id + "&key="+ key +"'>인증하기</a></p>"
						+"(first에 가입한적이 없다면 무시하셔도 됩니다)";
		
		try {
			mail.setSubject("[본인인증] first님의 인증메일입니다","utf-8");
			mail.setText(htmlTxt, "utf-8" , "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	@Override
	public int keyAuth(String id, String key) {
		// TODO Auto-generated method stub
		return mDao.alterKey(id,key);
	}

	

}
