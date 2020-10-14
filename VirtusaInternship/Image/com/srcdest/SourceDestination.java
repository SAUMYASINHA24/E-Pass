package com.srcdest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SourceDestination extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String source = request.getParameter("source");
		String dest = request.getParameter("dest");
		HttpSession session=request.getSession();
		String username = (String)(session.getAttribute("username"));
		String email = (String)(session.getAttribute("email"));
		
		PrintWriter out = response.getWriter();
		out.println(username);
		SrcDestDao sd = new SrcDestDao();
		sd.setSrcDest(username,source,dest,email);
		RequestDispatcher rd = request.getRequestDispatcher("form_fill.jsp");
		rd.forward(request, response);
		
		
	}

}
