package com.interviewscheduling.project;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

public class CustomerMail {

	public void send(String to, String subject, String msg) {
		final String from = "gowri.asokan@a-cti.com";
		final String pass = "1964@ashok";

		// Step:1 Get the Session object
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, pass);
			}
		});

		// Step 2: compose message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setText(msg);
			message.setContent("Hi, <br> Your Interview has been successfully scheduled. <br />Thank you <br>",
					"text/html; charset=utf-8");

			// Step 3 : Send Message

			Transport.send(message);

			System.out.println("The mail send successfully");
		} catch (MessagingException e) {
			throw new RuntimeException(e);

		}

	}

}
