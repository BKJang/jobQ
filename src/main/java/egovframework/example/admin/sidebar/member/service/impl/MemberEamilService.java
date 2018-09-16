package egovframework.example.admin.sidebar.member.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.member.domain.AdminMemberEmailVO;


@Service
public class MemberEamilService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Async
	public boolean sendEmail(AdminMemberEmailVO emailVO) throws Exception{
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
		
		List<String> idList = emailVO.getIdList();
		List<String> emailList = emailVO.getEmailList();
		List<String> nameList = emailVO.getNameList();
		// InternetAddress[] addresses = getInternetAddresses(emailVO);
				
		for(int i = 0 ; i < idList.size() ; i++){
			String content = precessContentWithId(idList.get(i), emailVO.getContent());
			
			messageHelper.setFrom("dbsdy1235@gmail.com", "잡큐");
			messageHelper.setTo(new InternetAddress(emailList.get(i), nameList.get(i), "utf-8"));
			messageHelper.setSubject(emailVO.getTitle());
			messageHelper.setText(content, true);
			
			mailSender.send(message);
		}
			
		return false;
	}
	
	private String precessContentWithId(String id, String content){
		content = content.replace("[ID]", id);
		
		return content;
	}
	
	private InternetAddress[] getInternetAddresses(AdminMemberEmailVO emailVO) throws UnsupportedEncodingException{
		InternetAddress[] addresses = new InternetAddress[emailVO.getEmailList().size()];
		
		for (int i = 0; i < addresses.length; i++) 
			addresses[i] = new InternetAddress(emailVO.getEmailList().get(i), emailVO.getNameList().get(i), "utf-8");
		
		return addresses;
	}
	
	private String processContentWithPwd(){
		return "";
	}
}
