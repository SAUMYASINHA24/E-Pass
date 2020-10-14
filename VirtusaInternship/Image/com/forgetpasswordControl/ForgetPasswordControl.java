package com.forgetpasswordControl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Signin.LoginUserDao;


public class ForgetPasswordControl extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		session.setAttribute("email",email);
		LoginUserDao ld = new LoginUserDao();
		String username = ld.getPhone(email);	
		if(!username.equals("Not Found"))
		{	
			request.setAttribute("email", email);
			request.setAttribute("username", username);
			RequestDispatcher rd = request.getRequestDispatcher("OtpCreate");
			rd.forward(request, response);
		}
		else
		{		
			RequestDispatcher rd1 = request.getRequestDispatcher("alert_notregistered.jsp");
			rd1.forward(request, response);
		}
			
	}

}
