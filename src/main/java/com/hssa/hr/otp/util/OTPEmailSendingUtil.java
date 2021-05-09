/**
 * 
 */
package com.hssa.hr.otp.util;

/**
 * @author USER
 *
 */
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/*import com.hssa.invoice.inquiry.ComplaintNumberGenerator;*/

public class OTPEmailSendingUtil {

	/**
	 * @param args
	 */
	
	 public static String sendEmail(String emailTo , String optpNum ){
		/* 425822*/
		 //generateMailMessage.setFrom(new InternetAddress("servicerequest-hssa@lafargeholcim.com", "Visitor@HSSA"));
			String host = "smtp.ap.holcim.net";
			String from = "LH-OTP@lafargeholcim.com";
			
		
			String sponserName=emailTo.replace("@lafargeholcim.com", "");
			
			sponserName=sponserName.replace(".", " ").toUpperCase();
			Date date = new Date();
			SimpleDateFormat  dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			String subject = "LH OTP Authentication  :   "+optpNum; /*"   Dated On  "+dateFormat.format(date)*/
			String messageText = "Dear "+sponserName+"<br><br> Please find your one time password token as follows  dated on  "+dateFormat.format(date)+
					"<br> <b> Your OTP Number :</b>  <br> <div style='background:#d9edf7;border:1px solid #bce8f1;color:#3a87ad;text-align:center;font-size:42px;padding:20px'><strong>"+optpNum+
					"</strong> </div><br><br> If you have not generated OTP number then , Kindly  contact your administrator .\n <br><br> Regards,<br> LH Global Hub App Administration.";
			boolean sessionDebug = false;
			Properties props = System.getProperties();
			props.put("mail.host", host);
			props.put("mail.transport.protocol", "smtp");
			Session session = Session.getDefaultInstance(props, null);
			session.setDebug(sessionDebug);
			try {
				Message msg = new MimeMessage(session);
				try {
					msg.setFrom(new InternetAddress(from, "LH-OTP : Authentication OTP token"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			//	msg.setFrom(new InternetAddress(from));
				InternetAddress[] address = { new InternetAddress(emailTo) };
				msg.setRecipients(Message.RecipientType.TO, address);
				msg.setSubject(subject);
				msg.setSentDate(new Date());
				msg.setContent(messageText,"text/html");
				Transport.send(msg);
			} catch (MessagingException mex) {
				mex.printStackTrace();
			}
			return messageText;
		}

	 public static String sendActivationEmail(String emailTo , String optpNum,String firstname ){
			String host = "smtp.ap.holcim.net";
			String from = "CompetitorDynamicMonitor@lafargeholcim.com";
			String subject = "Competitor Dynamic Monitor Account Activation !!!"; 
			String messageText = "Dear "+firstname+"<br><br> <b>Congratulations! You have been registered successfully on Competitor Dynamic Monitor App!!  </b>"+
					
					"<br> Please click the link below to activate your account: .\n <br>"
					+ "<br>"
					+ "\n"
					+"\n"
					+"<a href=\"https://hanzapps.oc.holcim.net/CompetitorDynamicsMonitor/rest/registration/activateprofile/"+emailTo+"/"+optpNum+"\" target=\"_blank\"><b>Activate Account</b></a>"
					+ "<br> Regards,<br> LH Global Hub App Administration.";
			boolean sessionDebug = false;
			Properties props = System.getProperties();
			props.put("mail.host", host);
			props.put("mail.transport.protocol", "smtp");
			Session session = Session.getDefaultInstance(props, null);
			session.setDebug(sessionDebug);
			try {
				Message msg = new MimeMessage(session);
				try {
					msg.setFrom(new InternetAddress(from, "Competitor Dynamic Monitor"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			//	msg.setFrom(new InternetAddress(from));
				InternetAddress[] address = { new InternetAddress(emailTo) };
				msg.setRecipients(Message.RecipientType.TO, address);
				msg.setSubject(subject);
				msg.setSentDate(new Date());
				msg.setContent(messageText,"text/html");
				Transport.send(msg);
			} catch (MessagingException mex) {
				mex.printStackTrace();
			}
			return messageText;
		}
}
