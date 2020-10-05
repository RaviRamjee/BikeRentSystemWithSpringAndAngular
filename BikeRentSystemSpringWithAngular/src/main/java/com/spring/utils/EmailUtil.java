package com.spring.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.spring.user.User;

public class EmailUtil {

	public static boolean isValid(String email) {
		String regex = "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z" + "A-Z]{2,7}$";
		if (email == null) {
			return false;
		}
		return email.matches(regex);
	}

	public static void regMail(User user,String to) {
		String from = "bikerenting@googlegroups.com";

		/*Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", 587);

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, "mca4182@");
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("Your registration status");
			message.setText("Registration is successful ! ,Your password is: " + user.getUserPassword());
			Transport.send(message);
			System.out.println("message sent successfully");
		} catch (MessagingException me) {
			me.printStackTrace();
		}*/
		String host = "smtp.gmail.com";

	    Properties properties = System.getProperties();

	    properties.setProperty("mail.smtp.host", host);

	    Session session = Session.getDefaultInstance(properties);

	    try{

	       MimeMessage message = new MimeMessage(session);


	       message.setFrom(new InternetAddress(from));


	       message.addRecipient(Message.RecipientType.TO,
	                                new InternetAddress(to));


	       message.setSubject("Your registration status");
	       message.setContent("Hi,<br>"+to+" your registration is successful", "text/html; charset=utf-8");
	       
	       Transport.send(message);
	       System.out.println(message);
	    }catch (MessagingException mex) {
	        mex.printStackTrace();
	     }

	  }
	

}
