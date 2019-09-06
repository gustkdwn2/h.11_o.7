package edu.kosta.kostarbucks.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.kostarbucks.service.EmailService;
import edu.kosta.kostarbucks.service.IdeaBoardService;
import edu.kosta.kostarbucks.vo.MemListVo;

@Controller
public class MailController {
	@Autowired 
	private JavaMailSender mailSender;
	
	private EmailService emailService;
	private IdeaBoardService ideaBoardService;
	
	@Autowired
	public void setIdeaBoardService(IdeaBoardService ideaBoardService) {
		this.ideaBoardService = ideaBoardService;
	}

	@Autowired 
	public void setEmailService(EmailService emailService) {
		this.emailService = emailService;
	}

	private String from 	= "kostatriplec@gmail.com";
	private String subject	= "[KostarBucks] 축하합니다. 아이디어가 채택되었습니다!";
	private String to = null;
	
	// 아이디어 채택해서 메일로 상품권 보내는 컨트롤러
	@RequestMapping("mail.do")
	public ModelAndView sendMail(String mem_name, String idea_num) {
		ModelAndView mav = new ModelAndView("member/success");
		
		// 아이디어 게시판의 상태를 채택으로 변경하는 서비스
		ideaBoardService.stateUpdate(idea_num);
		
		// 해당 회원의 메일을 가져오는 서비스
		MemListVo vo = emailService.findEmail(mem_name);
		to=vo.getMem_email();
		
		// 난수 발생하는 서비스
		String key1 = emailService.createkey();
		String key2 = emailService.createkey();
		String key3 = emailService.createkey();
		String key4 = emailService.createkey();
		String key5 = emailService.createkey();
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(to);
			messageHelper.setText("아이디어 채택을 축하드립니다! <br>KostarBucks에서 이용 가능 한 10,000원권 상품권 5장을 발급하였습니다!"
			+"<br>각각의 번호는 [ "+key1+" ][ "+key2+" ][ "+key3+" ][ "+key4+" ][ "+key5+" ] 입니다."
					+ "<br>계산시 상품권번호를 말씀해주세요. 앞으로도 많은 사랑부탁드립니다.");
			messageHelper.setFrom(from);
			messageHelper.setSubject(subject);	
			mailSender.send(message); // 메일 전송
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
}
