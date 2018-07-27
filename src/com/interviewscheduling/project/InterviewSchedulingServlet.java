package com.interviewscheduling.project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class InterviewSchedulingServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setContentType("text/plain");
	resp.getWriter().println("Thanks for registering");
		
	String firstname = req.getParameter("firstname");
	String emailaddress = req.getParameter("email");
	
	if(firstname.isEmpty()){
			
			String message = "<p style = \"color:red;\"> Enter mandatory fields </p>";
			req.setAttribute("errormsg", message);
			RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, resp);
			
		}
	else {}
		
		
		
		
	}
}
