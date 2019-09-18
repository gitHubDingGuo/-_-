package com.netdisc.vo;

import java.util.Date;
import lombok.Data;

@Data
public class ShareVo {

	private Integer sid;
	private String sname;
    private Date shareTime;
	 /**
	  * 分享校验码
	  */
	private String checkCode;
	private String deadTime;
	private String suffix;
}
