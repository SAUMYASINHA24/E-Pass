package net.javaguides.fileupload.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FileUploadDao {

    private static final String url = "jdbc:mysql://localhost:3306/project?useSSL=false";
    private static final String user = "root";
    private static final String password = "1234";

    private static String sql = "update applicant_details_form set Documents = (?) where Aadhar = (?)";
   
    public int uploadToken(String aadhar,int token)
    {
    	int row = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        String sql1 = "update applicant_details_form set Token = (?) where Aadhar = (?)";
        try (
        	Connection connection = DriverManager.getConnection(url, user, password);
        
            
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement(sql1)) {

            preparedStatement.setString(2,aadhar);
            preparedStatement.setInt(1, token);
            

          
            row = preparedStatement.executeUpdate();

        } catch (SQLException e) {
           
            printSQLException(e);
        }
        return row;
    }
    
    
    public int uploadFile(String aadhar,InputStream file) {
        int row = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        try (
        	Connection connection = DriverManager.getConnection(url, user, password);
        
            
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement(sql)) {

            preparedStatement.setString(2,aadhar);
            if (file != null) {
                // fetches input stream of the upload file for the blob column
                preparedStatement.setBinaryStream(1, file);
                
               // preparedStatement.setInt(2, token);
            }

            // sends the statement to the database server
            row = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return row;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}