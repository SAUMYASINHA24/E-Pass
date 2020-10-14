package com.status;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Status extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int token = (Integer)(session.getAttribute("token"));
		String filename = "form"+token;
		String status = "Pending";
		StatusDao sd = new StatusDao();
		sd.setData(token,filename,status);
		RequestDispatcher rd = request.getRequestDispatcher("action_file_upload.jsp");
		rd.forward(request, response);
		
		
		
		
		
	}

}
