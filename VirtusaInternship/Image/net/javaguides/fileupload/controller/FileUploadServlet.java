package net.javaguides.fileupload.controller;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import net.javaguides.fileupload.dao.FileUploadDao;

import java.util.Random;
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class FileUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FileUploadDao fileUploadDao;

    @Override
    public void init() 
    {
        fileUploadDao = new FileUploadDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // gets values of text fields
    	
    	String aadhar = (String)(request.getParameter("aadhar"));
        InputStream inputStream = null; // input stream of the upload file

        String message = null;
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        Random rand = new Random();
		int token = (rand.nextInt(900000000) + 100000000);
        // sends the statement to the database server
        int row = fileUploadDao.uploadFile(aadhar,inputStream);
        
        int row1 = fileUploadDao.uploadToken(aadhar,token);
        if (row > 0 && row1>0) {
            message = "File uploaded and saved into database";
        }

        // sets the message in request scope
        request.setAttribute("Message", message);
        HttpSession session1 = request.getSession();
        session1.setAttribute("token", token);
        
        // forwards to the message page
        request.setAttribute("photo", filePart);
        getServletContext().getRequestDispatcher("/preview.jsp")
        .forward(request, response);
        
        //getServletContext().getRequestDispatcher("/action_file_upload.jsp")
            //.forward(request, response);
    }
}