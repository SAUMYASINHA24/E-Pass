package com.admin_registration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// AdminLogin
public class AdminLogin extends HttpServlet {
	
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session=request.getSession();  
        session.setAttribute("username",username);
        LoginAdminDao ad = new LoginAdminDao();
        Boolean b = ad.getDetails(username,password);
		if(b)
		{
			RequestDispatcher rd1 = request.getRequestDispatcher("admin_dashboard.jsp");
			rd1.forward(request, response);		
		}
		else
		{
			RequestDispatcher rd1 = request.getRequestDispatcher("admin_registration_invalid.jsp");
			rd1.forward(request, response);	
		}
		
	}

}
