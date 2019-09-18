package com.netdisc.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;



public class ShareUtil {
	
	 private static final String USERNAME_PREFIX = "http://localhost:8080/netdisc/share/";
	
	public static List<String> getSCode(){
		Random random = new Random();
		String str = UUID.randomUUID().toString().replace("-", "");
	    StringBuilder stringBuilder= new  StringBuilder(str);
	    stringBuilder.insert(12, "_");
	    List<String>slist = new ArrayList<String>();
	    String s1=stringBuilder.toString().substring(0,23);
	    String s2=USERNAME_PREFIX+s1+".action";
	    slist.add(s1);
	    slist.add(s2);
	    return slist;
	}
	public static String getTcode(int n){
  	   
  	   String str = "123456789qwertyuioplkjhgfdsazxcvbnm";
  	   Random r = new Random();
  	   String ss="";
  	   for(int i=0;i<n;i++){
  		   char c = str.charAt(r.nextInt(str.length()));
  		   ss=ss+c;
  	   }
  	   return ss;
     }
}
