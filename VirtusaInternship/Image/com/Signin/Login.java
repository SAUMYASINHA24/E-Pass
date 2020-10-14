package com.Signin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// signin
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session=request.getSession();  
        session.setAttribute("username",username);
		LoginUserDao ld = new LoginUserDao();
		Boolean b = ld.getDetails(username,password);
		if(b)
		{
			RequestDispatcher rd = request.getRequestDispatcher("epassfile.jsp");
			rd.forward(request, response);		
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("user_registration_invalid.jsp");
			rd.forward(request, response);	
		}
	}

}
