package com.trialCount;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.FileNotFoundException;
import java.io.FileReader;

import java.util.Iterator;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;


public class trialcount {
	
	public String getJSON(String url) {
	    HttpURLConnection c = null;
	    try {
	        URL u = new URL(url);
	        c = (HttpURLConnection) u.openConnection();
	        c.setRequestMethod("GET");
	        c.connect();
	        int status = c.getResponseCode();

	        switch (status) {
	            case 200:
	            case 201:
	                BufferedReader br = new BufferedReader(new InputStreamReader(c.getInputStream()));
	                StringBuilder sb = new StringBuilder();
	                String line;
	                while ((line = br.readLine()) != null) {
	                    sb.append(line+"\n");
	                }
	                br.close();
	                return sb.toString();
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } 
	    finally {
	       if (c != null) {
	          try 
	          {
	              c.disconnect();
	          } 
	          catch (Exception ex) 
	          {
	             ex.printStackTrace();
	          }
	       }
	    }
	    return null;
	}
	public int[] getData(String srcdistrict,String destdistrict,String source,String destination) 
	{
		System.out.println(srcdistrict);
		System.out.println(destdistrict);
		System.out.println(source);
		System.out.println(destination);
		
		JSONObject json = (JSONObject) new JSONObject(getJSON("https://api.covid19india.org/state_district_wise.json")).get(source);
		
		JSONObject json1 = (JSONObject)json.get("districtData");
		JSONObject json2 = (JSONObject)json1.get(srcdistrict);
		int srccount = json2.getInt("active");
		System.out.println(srccount);
		JSONObject json3 = (JSONObject) new JSONObject(getJSON("https://api.covid19india.org/state_district_wise.json")).get(destination);
		
		JSONObject json4 = (JSONObject)json3.get("districtData");
		JSONObject json5 = (JSONObject)json4.get(destdistrict);
		int destcount = json5.getInt("active");
		System.out.println(destcount);
		int finalreturn[] = new int[2];
		finalreturn[0] = srccount;
		finalreturn[1] = destcount;
		return(finalreturn);
		
		
	}
	
	
}
