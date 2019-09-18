package com.netdisc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.netdisc.pojo.Share;

/**
 * @author Stodger
 * @date 2019年8月28日
 * @version
 */
@Repository
@Mapper
public interface ShareMapper {
    /**
     * 根据Id删除分享(不推荐使用)
     * @param id
     * @return
     */
	int deleteByPrimaryKey(Integer id);

    /**
     * 添加分享(含空值)
     * @param record
     * @return
     */
	int insert(Share record);

    /**
     * 添加分享(不含空值)
     * @param record
     * @return
     */
	int insertSelective(Share record);

    /**
     * 根据Id查询
     * @param id
     * @return
     */
	Share selectByPrimaryKey(Integer id);

    /**
     * 更新分享(不含空值)
     * @param record
     * @return
     */
	int updateByPrimaryKeySelective(Share record);

    /**
     * 更新分享(含空值且包含content字段)
     * @param record
     * @return
     */
	int updateByPrimaryKeyWithBLOBs(Share record);

    /**
     * 更新分享(含空值但不包含content字段)
     * @param record
     * @return
     */
	int updateByPrimaryKey(Share record);
	
	/**
	 * 根据userId找到我的分享
	 * @param userId
	 * @return
	 */
	List<Share> selectAllByUserId(String userId);
	
	/**
	 * 根据链接查找分享
	 * @param url
	 * @return
	 */
	Share selectBycheckcode(String url); 
}