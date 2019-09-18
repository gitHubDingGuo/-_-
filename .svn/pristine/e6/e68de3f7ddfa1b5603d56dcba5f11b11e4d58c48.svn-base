package com.netdisc.pojo;

import java.util.Date;

import lombok.Data;

/**
 * @author Stodger
 * @date 2019年8月28日
 * @version
 */
@Data
public class Folder {
    /**
     * 文件夹Id(自增)
     */
    private Integer id;

    /**
     * 用户Id
     */
    private String userId;

    /**
     * 文件夹名称
     */
    private String folderName;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 删除时间
     */
    private Date deleteTime;

    /**
     * 父目录
     */
    private Integer parentDirectory;

    /**
     * 状态
     */
    private Integer status;
    
    

	@Override
	public String toString() {
		return "Folder [id=" + id + ", userId=" + userId + ", folderName=" + folderName + ", updateTime=" + updateTime
				+ ", deleteTime=" + deleteTime + ", parentDirectory=" + parentDirectory + ", status=" + status + "]";
	}



	public Folder(Integer id, String userId, String folderName, Date updateTime, Date deleteTime,
			Integer parentDirectory, Integer status) {
		super();
		this.id = id;
		this.userId = userId;
		this.folderName = folderName;
		this.updateTime = updateTime;
		this.deleteTime = deleteTime;
		this.parentDirectory = parentDirectory;
		this.status = status;
	}



	public Folder() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}