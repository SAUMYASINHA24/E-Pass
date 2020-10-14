package com.otpcreation;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emailverification.EmailVerification;

public class OtpCreate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email  = (String)(request.getAttribute("email"));
		String username = (String)(request.getAttribute("username"));
		Random rand = new Random();
		int otp = rand.nextInt(900000) + 100000;
		HttpSession session = request.getSession();
		session.setAttribute("otp",otp);
		System.out.println("Your OTP is"+otp);	
		String message = "Your OTP is:"+" "+otp;	
		String success="Your message sent sucessfully";
		final String emailusername= "saumyasinhatest@gmail.com";
		final String emailpassword = "Jaimatadi@123";
		String subject = "E-Pass - OTP form Email Verification ";
		String body = "Hi "+ username +",\n" +
						"Greetings from E-Pass Seva.\n" +
						"Your One Time Password (OTP) is " + otp +". Please do not share it with anyone.Incase of any discrepancy kindly mail it to "+emailusername;
		EmailVerification e = new EmailVerification();
		e.sendFromGmail(emailusername, emailpassword,email, subject, body);
		response.sendRedirect("otp1.jsp");
		
		
	}

}
