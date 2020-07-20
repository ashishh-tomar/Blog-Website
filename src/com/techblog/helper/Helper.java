package com.techblog.helper;

import java.io.*;
import java.io.FileOutputStream;



public class Helper {
	
	public static  boolean deleteFile(String path)
	{
		boolean flag=false;
		try {
			
			File f=new File(path);
			flag=f.delete();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public static boolean saveFile(java.io.InputStream inputStream,String path)
	{
		boolean flag=false;
		
		try {
			
			byte[] b=new byte[inputStream.available()];
			
			inputStream.read(b);

			
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(b);
			
			fos.flush();
			fos.close();
			
			flag=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		///Not Working so leave it
		
		
		return flag;
	}

}
