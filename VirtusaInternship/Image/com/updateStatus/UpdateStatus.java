package com.updateStatus;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.status.StatusDao;


public class UpdateStatus extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String q2 = request.getParameter("accept");
		PrintWriter out = response.getWriter();
		
		
		HttpSession session1 = request.getSession();
		int token = (Integer)(session1.getAttribute("token"));
		
		//System.out.println(token);
	    // compare selected value 
	    if ("a".equals(q2))
	    {
	    	StatusDao sd = new StatusDao();
	    	String status = "You have approved the application";
	    	String status1 = "Approved";
			sd.updateData(status1,token);
			request.setAttribute("status", status);
			
	    }
	    else if("r".equals(q2))
	    {
	    	StatusDao sd = new StatusDao();
	    	String status = "You have rejected the application";
	    	String status1 = "Rejected";
			sd.updateData(status1,token);
			request.setAttribute("status", status);
			
	    }
	    else
	    {
	    	StatusDao sd = new StatusDao();
	    	String status = "The application is still on hold";
	    	String status1 = "Pending";
			sd.updateData(status1,token);
			request.setAttribute("status", status);
			
	    }
	    
	    RequestDispatcher rd = request.getRequestDispatcher("finaldeclare.jsp");
		rd.forward(request, response);
	    	
	}

}
