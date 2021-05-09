/**
 * 
 */
package com.hssa.hr.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.imageio.ImageIO;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.PreencodedMimeBodyPart;
import javax.mail.util.ByteArrayDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hssa.hr.model.ContentIdGenerator;
import com.hssa.hr.model.Email;
import com.hssa.hr.model.ErrorResponseTO;
import com.hssa.hr.model.SuccessResponse;
import com.hssa.hr.model.ThankYouTO;
import com.hssa.hr.service.ThankyouService;
/**
 * @author USER
 *
 */
@RestController
@RequestMapping(path="/rest/greetings", produces="application/json")
public class ThankYouCardController {
	@Autowired
	ThankyouService service;
	
	@RequestMapping(path = "/savegreeting", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<?> saveLeads(@RequestBody  ThankYouTO request) throws Exception {
		SuccessResponse message=new SuccessResponse();
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String currentDate = formatter.format(date);
		ThankYouTO data=new ThankYouTO();
		try {
			data.setFromname(request.getFromname());
			data.setToname(request.getToname());
			data.setReason(request.getReason());
			data.setCreatedDate(currentDate);
			service.savegreetings(data);
//			Email email=new Email();
//			email.setFrom("m.kadam.ext1@lafargeholcim.com");
//			email.setTo("rakesh.bake.ext1@lafargeholcim.com");
//			email.setImage("adgasdgsdsd");
//			email.setMessage("hshdsd");
//			email.setSubject("sdsdsdsd");
//			 			 sendEmail(email);
			message.setSuccesscode("200");
			message.setMessage("data saved successfully !!!");
			return new ResponseEntity<SuccessResponse>(message, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			ErrorResponseTO errorResponse = new ErrorResponseTO();
			errorResponse.setErrorCode(500);
			errorResponse.setErrorMessage("data not created successfully !!!");
			errorResponse.setUserMessage("Internal server error");
			return new ResponseEntity<ErrorResponseTO>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}	
	@PostMapping(path = "/send-email", consumes = "application/json", produces = "application/json")
	public  void sendEmail(@RequestBody Email email) throws MessagingException, IOException{
		String host = "smtp.ap.holcim.net";
		String from = "test@lafargeholcim.com";//ePOD-OTP@lafargeholcim.com";

		Date date = new Date();
		SimpleDateFormat  dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		/* String subject = "OTP Authentication  :   "+ loginOTP; "   Dated On  "+dateFormat.format(date)
		String messageText = "Dear "+ firstName + " " + lastName + ",<br><br> Please find your one time password for ePOD Application as follows<br> <b> Your OTP :</b>  <br> <div style='background:#d9edf7;border:1px solid #bce8f1;color:#3a87ad;text-align:center;font-size:42px;padding:20px'><strong>"+ loginOTP+
		"</strong> </div><br><br> If you have not generated OTP number then , Kindly  contact your administrator .\n <br><br> Regards,<br> Administrator";
		*/
		String subject = email.getSubject(); /*"   Dated On  "+dateFormat.format(date)*/
		String imageText=email.getImage();  
		System.out.println(imageText);
		byte[] bytes=null;
		String greetings=ContentIdGenerator.getContentId()+"ThankYou.jpg";
		String partSeparator = ",";
		if (imageText.contains(partSeparator)) {
		  String encodedImg = imageText.split(partSeparator)[1];
		 bytes = Base64.getDecoder().decode(encodedImg.getBytes(StandardCharsets.UTF_8));
		 
		  Path destinationFile = Paths.get("D://jrmapp//signonglassdev", greetings);
		  Files.write(destinationFile, bytes);
		}		
//		  try { 
//		        String path = "/D://jrmapp//signonglassdev"; 
//		        FileOutputStream stream = new FileOutputStream(path); 
//		        try {
//					stream.write(bytes);
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} 
//		    } catch (FileNotFoundException e) { 
//		        e.printStackTrace(); 
//		    } 
		  
		
//		byte[] decodedImg = Base64.getDecoder()
//                .decode(imageText.getBytes(StandardCharsets.UTF_8));
//Path destinationFile = Paths.get("/path/to/imageDir", "myImage.jpg");
//Files.write(destinationFile, decodedImg);
		
		
		
		
		
		  MimeMultipart content = new MimeMultipart("related");
		  
		  String cid = ContentIdGenerator.getContentId();

		  MimeBodyPart textPart = new MimeBodyPart();
		    textPart.setText("<html><head>"
		      + "<title></title>"
		      + "</head>\n"
		      + "<body><div><b></b></div>"
		      + "<div></div>\n"
		      + "<div><img src=\"cid:"
		      + cid
		      + "\" /></div>\n" + "<div></div></body></html>", 
		      "US-ASCII", "html");
		    content.addBodyPart(textPart);
		    MimeBodyPart imagePart = new MimeBodyPart();
		    imagePart.attachFile("D://jrmapp//signonglassdev//"+greetings);
		    imagePart.setContentID("<" + cid + ">");
		    imagePart.setDisposition(MimeBodyPart.INLINE);
		    content.addBodyPart(imagePart);
				 

//				  MimeBodyPart imagePart = new MimeBodyPart();
//
//				  imagePart.attachFile("resources/teapot.jpg");
//
//				  imagePart.setContentID("<" + cid + ">");
//
//				  imagePart.setDisposition(MimeBodyPart.INLINE);
//
//				  content.addBodyPart(imagePart);
//		  
		  
		  
		  
		
		
		
//		Multipart multiPart = new MimeMultipart("related");
//		                                  
//		MimeBodyPart filePart = new PreencodedMimeBodyPart("base64");		
//		
//		BodyPart imagePart = new MimeBodyPart();
//		ByteArrayDataSource imageDataSource = new ByteArrayDataSource(bytes,"image/*");
////		 DataSource fds = new FileDataSource( "/home/manisha/javamail-mini-logo.png");
		
		
//		imagePart.setDataHandler(new DataHandler(imageDataSource));
//		
//		Map<String, String> inlineImages = new HashMap<String, String>();
//		inlineImages.put("ID123456",imageText);
//		imagePart.setHeader("Content-ID","<qrImage>");
//		String message="<img src=\"cid:qrImage\" alt=\"Greetings Card\">";
//		
//		 imagePart.setFileName("Thank-You.png");
//		 try {
//			multiPart.addBodyPart(imagePart);
//		} catch (MessagingException e1) {
//			// TODO Auto-generated catch block
//		e1.printStackTrace();
//		}

		//String messageText ="<img src='https://blog.mailtrap.io/wp-content/uploads/2018/11/blog-illustration-email-embedding-images.png?w=640' alt=\"So Crisp\" width=\"600\" height=\"400\" border=\"0\" style=\"display: \" />";		
		boolean sessionDebug = false;
		Properties props = System.getProperties();
		props.put("mail.host", host);
		props.put("mail.transport.protocol", "smtp");
		Session session = Session.getDefaultInstance(props, null);
		session.setDebug(sessionDebug);
		try {
		Message msg = new MimeMessage(session);
		try {
		msg.setFrom(new InternetAddress(email.getFrom(), ""));
		
		} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}		
		String emailto=email.getTo();

		ArrayList recipientsArray = new ArrayList();
		StringTokenizer stringTokenizer = new StringTokenizer(email.getTo(), ",");

		while (stringTokenizer.hasMoreTokens()) {
		recipientsArray.add(stringTokenizer.nextToken());
		}
		int sizeTo = recipientsArray.size();
		InternetAddress[] addressTo = new InternetAddress[sizeTo];
		for (int i = 0; i < sizeTo; i++) {
		addressTo[i] = new InternetAddress(recipientsArray.get(i).toString());
		}
		msg.setRecipients(Message.RecipientType.TO, addressTo);

		//msg.setRecipients(Message.RecipientType.TO, address);
		msg.setSubject(subject);
		msg.setSentDate(new Date());
//		msg.setContent(imagePart,"text/html");
		msg.setContent(content,"text/html");
//		msg.setContent(multiPart,"image/png");
		
		Transport.send(msg);
		System.out.println("email sent---"+msg);
		} catch (MessagingException mex) {
		mex.printStackTrace();
		}
		return  ;
	}
	
	
}
