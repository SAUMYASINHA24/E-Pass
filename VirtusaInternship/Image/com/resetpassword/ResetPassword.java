package com.resetpassword;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Signin.LoginUserDao;


public class ResetPassword extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newpass = request.getParameter("newpass");
		String confirmpass  = request.getParameter("confirmpass");
		if(newpass.equals(confirmpass))
		{
			LoginUserDao ld = new LoginUserDao();
			HttpSession session=request.getSession();
			String email = (String)(session.getAttribute("email"));  
			ld.resetPassword(email,newpass);
			session.removeAttribute("email");
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Password changed successfully!!! Redirected to E-Pass application.');");
			out.println("location='epassfile.jsp';");
			out.println("</script>");
				
		}
		else
		{
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Passwords do not match.Re submit your data');");
			out.println("location='Renewpassword.jsp';");
			out.println("</script>");
		}
		
	}

}
