package com.netdisc.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class CapacityVo implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer has_capacity;
	private Integer total_capacity;

}
