package com.netdisc.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.netdisc.dao.FileMapper;
import com.netdisc.dao.FolderMapper;
import com.netdisc.dao.ShareMapper;
import com.netdisc.dao.UserMapper;
import com.netdisc.pojo.File;
import com.netdisc.pojo.FileVo;
import com.netdisc.pojo.Folder;
import com.netdisc.pojo.Share;
import com.netdisc.pojo.User;
import com.netdisc.service.IShareService;
import com.netdisc.util.ByteTransUtil;
import com.netdisc.util.ShareUtil;
import com.netdisc.vo.CheckData;
import com.netdisc.vo.ShareInfo;
import com.netdisc.vo.ShareVo;
import com.netdisc.vo.shareCode;

@Service
@Transactional
public class ShareServiceImpl implements IShareService {

	@Autowired
	private ShareMapper shareMapper;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private FolderMapper folderMapper;
	@Autowired
	private UserMapper userMapper;

	@Override
	public shareCode insertShareFileAndFolder(String fids, String fileName, String tcode, String day,String userId) {
		shareCode sharecode = new shareCode();
		Share share = new Share();
		if(Integer.parseInt(tcode)==1){
		String shareCode = ShareUtil.getTcode(4);
		sharecode.setTcode(shareCode);
		share.setShareCode(shareCode);
		}
		List<String>codeList = ShareUtil.getSCode();
		String checkCode= codeList.get(0);
		String checkCodeURl= codeList.get(1);
		sharecode.setCode(1);
		sharecode.setUrl(checkCodeURl);
		
		
		share.setUserId(userId);
		share.setContent(fileName);
		share.setEffectiveTime(Integer.parseInt(day));
		share.setShareTime(new Date());
		
		share.setCheckCode(checkCode);
		
		shareMapper.insertSelective(share);
		return sharecode;
	}

	@Override
	public List<ShareVo> findShareFileAndFolder(String userId) {
		List<Share>shareList = shareMapper.selectAllByUserId(userId);
		List<ShareVo>svoList = new ArrayList<ShareVo>();
		for(Share s:shareList){
			
			ShareVo shareVo = new ShareVo();
			shareVo.setSid(s.getId());
			String[] fileNameList =s.getContent().trim().split(",");
			if(fileNameList[0].indexOf(".")!=-1){
			shareVo.setSuffix(fileNameList[0].substring(fileNameList[0].lastIndexOf("."),fileNameList[0].length()));
			System.out.println(fileNameList[0].substring(fileNameList[0].lastIndexOf("."),fileNameList[0].length())+"--->");
			}
			
			shareVo.setSname(fileNameList[0]);
			shareVo.setShareTime(s.getShareTime());
			
			if(s.getShareCode()==null)shareVo.setCheckCode("http://localhost:8080/netdisc/share/"+s.getCheckCode()+".action");
			else shareVo.setCheckCode("http://localhost:8080/netdisc/share/"+s.getCheckCode()+".action"+"  提取码:"+s.getShareCode());
			
			if(s.getEffectiveTime()==-1)shareVo.setDeadTime("永久有效");
			else{
				long days = ((new Date().getTime())-s.getShareTime().getTime())/(1000*60*60*24);
				if(s.getEffectiveTime()-days>0) shareVo.setDeadTime(String.valueOf(String.valueOf(s.getEffectiveTime()-days))+"天后");
				else shareVo.setDeadTime("已失效");
				System.out.println(days);
			}
			
			svoList.add(shareVo);
			System.out.println(s);
		}
		for(ShareVo sh:svoList)System.out.println(sh+"--");
		return svoList;
	}

	@Override
	public String findIsTcode(String url) {
		String s;
		Share share = shareMapper.selectBycheckcode(url);
		if(share.getShareCode()==null)s="forward:sharefile.action?name="+url;
		else s="forward:sharetcode.action?name="+url;
		return s;
	}

	@Override
	public CheckData findShareCode(String url, String tcode) {
		Share share =shareMapper.selectBycheckcode(url);
		CheckData  checkData = new CheckData();
		if(share.getShareCode().equals(tcode))checkData.setOk(true);
		else checkData.setOk(false);
		checkData.setUrl(url);
		return checkData;
	}

	@Override
	public String findUserName(String url) {
		Share share = shareMapper.selectBycheckcode(url);
		User user = userMapper.selectByPrimaryKey(share.getUserId());
		return user.getUsername();
	}

	@Override
	public ShareInfo findShareInfo(String url) {
		Share share = shareMapper.selectBycheckcode(url);
		Integer flag=1;
		ShareInfo shareInfo = new ShareInfo();
		shareInfo.setUserId(share.getUserId());
		shareInfo.setSid(share.getId());
		shareInfo.setShareTime(share.getShareTime());
		if(share.getEffectiveTime()!=-1){
			long days = ((new Date().getTime())-share.getShareTime().getTime())/(1000*60*60*24);
			if(share.getEffectiveTime()-days<0)flag=-1;
		}
		String[] fileNameList =share.getContent().trim().split(",");
		shareInfo.setSname(fileNameList[0]);
		
		List<FileVo>fileVoList = new ArrayList<>();
		for(String ff:fileNameList){
			FileVo fileVo = new FileVo();
			
			if(ff.indexOf(".")!=-1){
				System.out.println("这是文件"+ff);
				File file = fileMapper.searchFileByFileName(ff);
				System.out.println("文件是"+file);
				fileVo.setFid(file.getId());
				fileVo.setIsdir(false);
				fileVo.setSuffix(ff.substring(ff.lastIndexOf("."),ff.length()));
				fileVo.setFname(file.getFileName());
				fileVo.setFsize(ByteTransUtil.getPrintSize(new Double(file.getFileSize()).longValue()));
				fileVo.setUpdatetime(file.getUpdateTime());
				System.out.println(ff.substring(ff.lastIndexOf("."),ff.length())+"--->");
				}
			else{
				System.out.println("这是文件夹");
				Folder folder = folderMapper.searchFolderByFolderName(ff);
				fileVo.setFid(folder.getId());
				fileVo.setIsdir(true);
				fileVo.setFname(folder.getFolderName());
				fileVo.setUpdatetime(folder.getUpdateTime());
				
			}
			fileVoList.add(fileVo);
			
		}
		if(flag==1)shareInfo.setFiles(fileVoList);
		else shareInfo=null;
		return shareInfo;
	}

	@Override
	public void findCancelShare(Integer sid) {
		shareMapper.deleteByPrimaryKey(sid);
		
	}
}
