package com.emailverification;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class EmailVerification {

	public void sendFromGmail(final String username, final String password, String emailId, String subject, String body) {
		Properties props = System.getProperties();
		String host = "smtp.gmail.com";
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", username);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator()
		{
		                    protected PasswordAuthentication getPasswordAuthentication() {
		                        return new PasswordAuthentication(username, password);
		                    }
		                });
		
		try
		{
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("saumyasinhatest@gmail.com"));		
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailId));
			
			message.setSubject(subject);
			message.setText(body);
			Transport transport = session.getTransport("smtp");
			transport.connect(host, username, password);
			transport.send(message);
			transport.close();
			System.out.println("success");
		}
		catch(AddressException ae)
		{
			ae.printStackTrace();
		}
		catch(MessagingException me)
		{
			me.printStackTrace();
		}
	}
}
