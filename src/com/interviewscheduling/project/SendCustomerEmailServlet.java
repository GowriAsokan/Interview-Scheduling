package com.interviewscheduling.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.labs.repackaged.org.json.JSONObject;
//import com.sun.istack.internal.logging.Logger;
import java.util.logging.Logger;

public class SendCustomerEmailServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		resp.setContentType("text/html");
		PrintWriter out 	= 	resp.getWriter();  
		
		Logger log = Logger.getLogger(HttpServlet.class.getName());
		
		String email = req.getParameter("data");
		System.out.println(email);
        String subject 		= 	"Full Creative Notifications";
		String msg          =   "Hi, Your interview has been scheduled successfully";
		
		log.info(subject + " " + msg);
		
		System.out.println( subject + " " + msg );
			try
			{
				JSONObject obj = new JSONObject(email);
				String to = obj.get("email_id").toString();
				System.out.println(to);
				CustomerMail mail = new CustomerMail();
				mail.send(to, subject, msg);  
        out.print("Success! Mail sent");  
			}
			catch(Exception e)
			{
				System.out.println("Customer email exception");
			}
			
    out.close();

		}
	}	