package com.netdisc.pojo;

import java.util.Date;

import lombok.Data;


/**
 * @author Stodger
 * @date 2019年8月28日
 * @version
 */
@Data
public class File {
    /**
     * 文件Id(自增)
     */
    private Integer id;

    /**
     * 用户Id
     */
    private String userId;

    /**
     * 文件夹Id
     */
    private Integer folderId;

    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件类型
     */
    private Integer fileType;

    /**
     * 文件大小
     */
    private Double fileSize;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 删除时间
     */
    private Date deleteTime;

    /**
     * 状态
     */
    private Integer status;

	@Override
	public String toString() {
		return "File [id=" + id + ", userId=" + userId + ", folderId=" + folderId + ", fileName=" + fileName
				+ ", fileType=" + fileType + ", fileSize=" + fileSize + ", updateTime=" + updateTime + ", deleteTime="
				+ deleteTime + ", status=" + status + "]";
	}
	
	public File() {};

	public File(Integer id, String userId, Integer folderId, String fileName, Integer fileType, Double fileSize,
			Date updateTime, Date deleteTime, Integer status) {
		super();
		this.id = id;
		this.userId = userId;
		this.folderId = folderId;
		this.fileName = fileName;
		this.fileType = fileType;
		this.fileSize = fileSize;
		this.updateTime = updateTime;
		this.deleteTime = deleteTime;
		this.status = status;
	}

	
	
	
    
    
}