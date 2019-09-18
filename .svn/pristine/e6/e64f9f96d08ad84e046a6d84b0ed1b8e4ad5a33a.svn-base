package com.netdisc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.netdisc.pojo.User;
import com.netdisc.service.IFolderService;
import com.netdisc.service.IShareService;
import com.netdisc.util.ShareUtil;
import com.netdisc.vo.CheckData;
import com.netdisc.vo.ShareInfo;
import com.netdisc.vo.ShareVo;
import com.netdisc.vo.shareCode;

import lombok.Getter;
import lombok.Setter;

/**
 * @author zero
 * @date 2019年9月4日
 * @version
 */
@Getter
@Setter
@Controller
@RequestMapping("/share")
public class ShareController {

	@Autowired
	private IShareService ishareService;
	
	
	/**
	 * 分享文件或者文件夹
	 * @param fids
	 * @param fileName
	 * @param tcode
	 * @param day
	 * @return
	 */
	@RequestMapping("/shareFolder")
	@ResponseBody
	public shareCode shareFolder(String fids,String fileName,String tcode,String day){
		System.out.println(fids+"<-----分享的字段---->"+fileName+"<-----分享的名字---->"+tcode+"提取码"+day+"天数");
		
		return ishareService.insertShareFileAndFolder(fids, fileName, tcode, day, "user_123");
	}
	/**
	 * 根据请求找到分享的文件并判断是否要提取码
	 * @param name
	 * @return
	 */
	@RequestMapping("{name}")
	public String share(@PathVariable("name")String name){
		System.out.println("share分享连接是"+"-------"+name);
		String s=ishareService.findIsTcode(name);
		return s;
	}
	/**
	 * 输入提取码
	 * @param name
	 * @param request
	 * @return
	 */
	@RequestMapping("/sharetcode")
	public String sharetcode(String name,HttpServletRequest request){
		System.out.println("sharetcode分享连接是"+"-------"+name);
		request.setAttribute("url", name);
		request.setAttribute("userName", ishareService.findUserName(name));
		return "tcode";
	}
	/**
	 * 判断提取码是否正确
	 * @param tcode
	 * @param url
	 * @return
	 */
	@RequestMapping("/inputTcode")
	@ResponseBody
	public CheckData inputTcode(String tcode,String url){
		System.out.println("inputTcode提取码是"+"-------"+tcode);
		CheckData checkData = ishareService.findShareCode(url, tcode);
		return checkData;
	}
	/**
	 * 进去分享的文件或者文件夹页面
	 * @param name
	 * @return
	 */
	@RequestMapping("/sharefile")
	public String sharefile(String name,HttpServletRequest request){
		System.out.println("sharefile分享连接是"+"-------"+name);
		ShareInfo shareInfo = ishareService.findShareInfo(name);
		request.setAttribute("shareInfo", shareInfo);
		User user = new User();
		user.setId("user_124");
		user.setUsername("zero");
		request.setAttribute("LOGIN_USER", user);
		return "sharefile";
	}
	
	/**
	 * 我的分享
	 * @param request
	 * @return
	 */
	@RequestMapping("/myShare")
	public String myShare(HttpServletRequest request){
		List<ShareVo>shareVoList = ishareService.findShareFileAndFolder("user_123");
		request.setAttribute("shares", shareVoList);
		return "myshare";
	}
	@RequestMapping("/cancelShare")
	@ResponseBody
	public String cancelShare(Integer sid){
		ishareService.findCancelShare(sid);
		System.out.println("sid"+sid);
		return "取消成功";
	}
	
}
