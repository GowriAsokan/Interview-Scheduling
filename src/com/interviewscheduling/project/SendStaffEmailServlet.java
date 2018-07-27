package com.interviewscheduling.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;
//import com.google.appengine.labs.repackaged.org.json.JSONObject;

public class SendStaffEmailServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		resp.setContentType("text/html");
		PrintWriter out 	= 	resp.getWriter();  
		Logger log = Logger.getLogger(HttpServlet.class.getName());
		
		String staffEmail = req.getParameter("data");
		System.out.println(staffEmail);
        String subject 		= 	"Notify";
		String msg          =   "Hi, You have an interview with the customer today";
		   
		log.info(subject + " " + msg);
		System.out.println(staffEmail+ ""+ subject + " " + msg );
			try
			{
				
				CustomerMail staffMail = new CustomerMail();
				staffMail.send(staffEmail, subject, msg);  
        out.print("staff email sent");  
			}
			catch(Exception e)
			{
				System.out.println("Staff email exception");
			}
			
    out.close();

		}
	}	