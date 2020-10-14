package com.IntermediateServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DetailDao.DetailDao;


public class InterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String srcdistrict  = (String)(request.getParameter("sdistrict"));
		String destdistrict  = (String)(request.getParameter("ddistrict"));
		String name  = (String)(request.getParameter("name"));
		String phone  = (String)(request.getParameter("phone"));
		String aadhar  = (String)(request.getParameter("aadhar"));
		String srcaddr  = (String)(request.getParameter("sourceadd"));
		String destaddr  = (String)(request.getParameter("destadd"));
		String dateofjourney  = (String)(request.getParameter("dateofjour"));
		String reason  = (String)(request.getParameter("reason"));
		String vehtype  = (String)(request.getParameter("vehtype"));
		String vehno  = (String)(request.getParameter("vehno"));
		String count  = (String)(request.getParameter("num"));
		
		request.setAttribute("phone", phone);
		DetailDao dd = new DetailDao();
		dd.setData(srcdistrict,destdistrict,name,srcaddr, destaddr, vehtype, vehno, reason, dateofjourney, aadhar, count, phone);
		RequestDispatcher rd = request.getRequestDispatcher("fileupload.jsp");
		rd.forward(request, response);
		
		
	}

}
