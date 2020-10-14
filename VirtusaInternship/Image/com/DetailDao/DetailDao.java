package com.DetailDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
public class DetailDao {
	
	
	public void setData(String srcdistrict,String destdistrict,String name,String sourceadd,String destadd,String vehtype,String vehno,String reason,String dateofjourney,String aadhar,String count,String phone)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
		
			Statement st = con.createStatement();
			
			int j=st.executeUpdate("insert into applicant_details_form(Name,SourceDistrict,DestDistrict,Phone,Aadhar,Sourceadd,Destadd,DateofJourney,reason,Vehicle_type,Vehicle_Number,Count)values('"+name+"','"+srcdistrict+"','"+destdistrict+"','"+phone+"','"+aadhar+"','"+sourceadd+"','"+destadd+"','"+dateofjourney+"','"+reason+"','"+vehtype+"','"+vehno+"','"+count+"')");
			
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			//System.out.println("mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			
		}	
	}
	
}
