package com.first.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.first.domain.MemberDTO;
import com.first.service.mail.MailService;
import com.first.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;
/*
 * SessionAttributs로 설정된 변수(객체)는
 * response를 하기전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다.
 * web browser와 server간에 한번이라도 연결이 이루어졌으면
 * Session..에 등록된 변수는 서버가 중단될 때 까지 그 값이 그대로 유지된다
 * web은 클아이언트의 req를 서버가 받아서
 * res를 수행하고 나면 모든 정보가 사라지는 특성이 있다.
 * 이런특성과는 달리 Spring 기반의 web은 일부데이터들을 메모리에 보관했다가 재사용하는 기법이 있다.
 * 그중 SessionAttributes라는 기능이 있다.
 * 
 *  SessionAttributes()에 설정하는 문자열은 클래스의 표준 객체 생성 패턴에 의해 만들어진 이름
 *  MomoDTO memoDTO
 *  
 *  이름을 표준패턴이 아닌 임의의 이름으로 바꾸고 싶다
 *  
 */
@SessionAttributes({"memberDTO"})
@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	@Autowired	
	PasswordEncoder passwordEncoder;
	@Autowired
	private MailService mailService;
	@ModelAttribute("memberDTO")
	public MemberDTO newMember(){
		return new MemberDTO();
	}
	@GetMapping("/constract")
	public String viewConstract() {
		log.info(">>>>>>>>>>MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";		
	}
	
	@GetMapping("/join")
	public String viewJoin(@ModelAttribute("memberDTO") MemberDTO mDto, @RequestParam(value="flag", defaultValue="0") String flag, Model model) {
		log.info(mDto.toString());
		model.addAttribute("flag", flag);
		if(!flag.equals("1")) {
			return "member/constract";
		}
		return "member/join";
		
		
	}
	/*
	 * join Post 가 mDto를 수신할 때 입력 form에서 사용자가 입력한 값들이 있으면 
	 * 그 값들을 mDto의 필드변수에 setting 하고
	 * 
	 * 만약 없으면 메모리 어딘가에 보관중인 SessionAttributes로 설정된
	 * mDto변수에서 값을 가져와서 비어있는 필드변수를 채워줘서 매개변수에 주입한다
	 * 
	 * 따라서 form에서 보이지 않아도 되는 값들은 별도의 코딩을 하지 않아도 자동으로
	 * join Post로 전송되는 효과를 낸다.
	 * 단, 이 기능을 효율적으로 사용하려면 jsp코드에서 Spring -form tag로 input을 코딩해야한다	 
	 */
	@PostMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus, HttpServletRequest request, RedirectAttributes rttr) {
		log.info(">>>>>>>>> 멤바 쪼인 포스트 디비에 회원정보 저장");
		log.info(mDto.toString());
		log.info("Password:"+mDto.getPw());
		String encPw= passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		log.info("password(+Hash):" +mDto.getPw());
		int result = mService.memInsert(mDto);
		if(result>0) {
			log.info(">>>>>>"+mDto.getId()+"님 회원가입되셨습니다.");
		}
		
		
		mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request);
		/*
		 * 세션어트리뷰트를 사용할때 , 인서트, 업데이트가 완료되고 뷰로 보내기전 반드시
		 * 셋컴플리트를 실행하여 세션에 담긴값을 클리어 해주어야한다.
		 */
		
		sessionStatus.setComplete();
		
		rttr.addFlashAttribute("id", mDto.getId());
		rttr.addFlashAttribute("email", mDto.getEmail());
		rttr.addFlashAttribute("key", "join");
		
		return "redirect:/";
	}
	@GetMapping("keyauth")
	public String keyAuth(String id, String key, RedirectAttributes rttr) {
		mailService.keyAuth(id, key);
		rttr.addFlashAttribute("id",id);
		rttr.addFlashAttribute("key", "auth");
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info(">>>> ID OVERLAP CHECK");
		log.info("아이디:"+id);
		
		int cnt = mService.idOverlap(id);
		String flag = "1";
		if(cnt==0) {
			flag="0";
		}
		return flag;
	}
	
	@GetMapping("/update")	
	public String memUpdate(Model model, HttpSession session){
		log.info(">>>>>>>>GET: Member UPdate page");
		
		String id = (String)session.getAttribute("userid");
		model.addAttribute("user", mService.userView(id));
		
		return "member/join";
	}
	@PostMapping("/update")
	public String memUpdate(MemberDTO mDto, HttpSession session) {
		log.info(">>>>POST: Member Update Action");
		log.info(mDto.toString());

		 mService.memUpdate(mDto, session);

		return "redirect:/";
	}
	@GetMapping("/pwupdate")	
	public String pwUpdate(){
		log.info(">>>>>>>>GET: Member pwUPdate page");
		return "member/pwupdate";
	}
	@PostMapping("/pwupdate")	
	public String pwUpdate(HttpSession session, MemberDTO mDto){
		log.info(">>>>>>>>POST: Member pwUPdate page");		
		log.info("수정빔빏	ㅓㄴ호 "+mDto.getPw());
		String encPw= passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		String id = (String)session.getAttribute("userid");
		mDto.setId(id);
		log.info(mDto.toString());
		mService.pwUpdate(mDto);
		return "redirect:/";		
	}
	@ResponseBody
	@PostMapping("/pwCheck")
	public Integer pwCheck(String pw, HttpSession session) {
		log.info(">>>>>>>> POST pw check");
		String id= (String)session.getAttribute("userid");
		
		return mService.pwCheck(id,pw);
	}
	@GetMapping("/drop")
	public String drop() {
		
		return "member/drop";
	}
	
	@GetMapping("/mypage") 
	public String mypage(HttpSession session, Model model) {
		String id= (String)session.getAttribute("userid");
		model.addAttribute("user", mService.userView(id));
		
		return "member/mypage";
	}
	@GetMapping("/dropAction")
	public String memDrop(HttpSession session, RedirectAttributes rttr) {
		String id =(String)session.getAttribute("userid");
		
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "dropResult");
		mService.memDrop(session, id);
		return "redirect:/";
	}
}	
