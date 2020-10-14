package com.usercheck;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Signin.LoginUserDao;

// process
public class Alreadyuser extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		session.setAttribute("email", email);
		
		LoginUserDao d1 = new LoginUserDao();
		Boolean b1 = d1.getUser(email);
		if(b1)
		{
			RequestDispatcher rd = request.getRequestDispatcher("forget_password_user_invalid.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("process.jsp");
			rd.forward(request, response);
		}
	}

}
