package com.netdisc.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class FileVo implements Comparable<FileVo>{
	private String fname;
	private Integer fid;
	private Boolean isdir;
	private String furl;
	private String suffix;
	private String fsize;
	private Date updatetime;
	@Override
	public int compareTo(FileVo o) {
	   if(this.updatetime.before(o.updatetime)) {
		   return -1;
	   }else if(this.updatetime.after(o.updatetime)) {
		   return 1;
	   }else {
		   return 0;
	   }
		
	}
}
