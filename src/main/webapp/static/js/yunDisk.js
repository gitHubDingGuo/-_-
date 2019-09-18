function fundFileByParentId(parentId,isdir){
	console.log(parentId);
	if(isdir){
		$.ajax({
		    url : "/netdisc/file/fundFileByParentId.action", 
			type: "post", 
			async:true,
			contentType:"application/x-www-form-urlencoded",
			data: {"parentId":parentId},
	        success: function(data){//如果调用servlet成功，响应200。请求成功后回调函数。这个方法有两个参数：服务器返回数据，返回状态(可以缺省)。
	        	console.log(data);
	        	document.getElementById('allChecks').checked = false;
	        	document.getElementById('filesListHeadChangChose').style.display='none';
				document.getElementById('filesListHeadChangBtn').style.display='block';
	        	$(".filesListRoute").find("a").remove();
	        	$(".filesListRoute").find("span").remove();
	        	//路径链
	           var link="";
	        	$.each(data.parent,function(i,file){
	        		console.log(data.parent);
	        		if(i==(data.parent.length-1)){
	        			link+="<span>"+file.fname+"</span>";
	        		}else{
	        			link+="<a onclick=\"fundFileByParentId(\'"+file.fid+"\',"+file.isdir+")\" href=\"javascript:;\"><span>"+file.fname+"</span></a>"
	        			link+="<span>></span>";
	        		}
	        	});
	        	$(".filesListRoute").append(link);
	        	$("#filesTab").find("tr").remove();
	        	$(".filesListCount").find("span").remove();
	        	$(".filesListCount").append("<span>已加载</span><span class='filesCount'>"+data.files.length+"</span><span>个</span>");
	        	$.each(data.files,function(i,file){
	        		console.log(2);
	        		var str="<tr data-file-id=\"1\" class=\"active\">";
	        		str+="<td><input type=\"checkbox\" class=\"checkstyle\" value="+file.fid+" onclick=\"allcheck(),display()\"/>";
	        		if(file.isdir){
	        			str+="<i class=\"fileIcon\"></i>";
	        		}else if(file.suffix == "jpg"){
	        			str+="<i id=\"btn\" onMouseOver=\"showInform(event,\'http://192.168.25.175/"+file.furl+"\')\" onMouseOut=\"hiddenInform(event)\" class=\"imgIcon\"></i>";
	        		}else if(file.suffix == "txt"){
	        			str+="<i class=\"txtIcon\"></i>";
	        		}else if(file.suffix == "mp4"){
	        			str+="<i class=\"videoIcon\"></i>";
	        		}else if(file.suffix == "seed"){
	        			str+="<i class=\"seedIcon\"></i>";
	        		}else if(file.suffix == "mp3"){
	        			str+="<i class=\"musicIcon\"></i>";
	        		}else{
	        			str+="<i class=\"otherIcon\"></i>";
	        		}
	        		str+="<a onclick=\"fundFileByParentId(\'"+file.fid+"\',"+file.isdir+")\" href=\"javascript:void(0);\" ><span class=\"fileTitle\" title="+file.fname+">"+file.fname+"</span></a>";
	        		str+="<div class=\"filesFns right\">";
	        		str+="<a class=\"icon icon-share\" href=\"javascript:;\">分享</a>";
	        		str+="<a onclick=\"downFile(\'"+file.fid+"\',\'"+file.furl+"\',\'"+file.fname+"\',\'"+file.suffix+"\',"+file.isdir+")\" class=\"icon icon-download\" href=\"javascript:;\">下载</a>";
	        		str+="<a class=\"icon icon-more\" href=\"javascript:;\">更多</a>";
	        		str+="</div></td><td><span>"
	        			if(file.fsize){
	            			str+=file.fsize+"</span></td>";
	            		}else{
	            			str+="——</span></td>";
	            		}
	        		str+="<td><span class=\"fileChangeDate\">"+dateFmt("yyyy-MM-dd",new Date(file.updatetime))+"</span></td></tr>";
	        		$("#filesTab").append(str);
	        	});
	        }
		});
	}else{
		$.ajax({
			url:"/netdisc/file/findFileByFid.action",
			type:"post",
			async:false,
			contentType:"application/x-www-form-urlencoded",
			data:{"fid":parentId},
			success:function(data) {
				console.log(data);
				var file = data;
				if(file.suffix == "jpg" ||file.suffix=="png"){
        			showImg("http://image.stodger.club/images/"+file.furl);
        		}else if(file.suffix == "txt"){
        		/*	window.open("http://192.168.25.175/"+file.furl);*/
        			window.open("http://image.stodger.club/images/"+file.fname);
        		}else if(file.suffix == "mp4"){
        			playVideo(file.furl, file.fname);
        		}else if(file.suffix == "seed"){
        			
        		}else if(file.suffix == "mp3"){
        			showJplayMusic("http://image.stodger.club/images/"+file.fname, file.fname);
        		}else if(file.suffix == "pdf"){
        			/*window.open("http://192.168.25.175/"+file.furl);*/
        			window.open("http://image.stodger.club/images/"+file.fname);
        		}else if(file.suffix == "doc" || file.suffix == "docx" || file.suffix == "xlsx" || file.suffix == "xls" || file.suffix=="ppt" || file.suffix=="pptx"){
        			window.open("https://view.officeapps.live.com/op/view.aspx?src=http://image.stodger.club/images/" + file.fname);
        		}
			}
		})
	}
}


//文件下载
function downFile(fid,fileurl , fileName , suffix , isdir){
	if(isdir){
		$.ajax({
			url:"/file/dirdownload",
			type: "post",
			async:true,
			contentType:"application/x-www-form-urlencoded",
			data: {"fid":fid},
			success: function(data){
				if(data=='200')
					alert('下载成功,请在桌面查看');
				else{
					alert('下载失败!!!');
				}
			},
			error: function(){
				alert('下载失败!!!');
			}
		})
	}else{
		$.ajax({
		    url : "/file/downlowd",
			type: "post",
			async:true,
			contentType:"application/x-www-form-urlencoded",
			data: {"fileurl":fileurl,'fileName':fileName,'suffix':suffix},
			success: function(data){
				if(data=='200')
					alert('下载成功,请在桌面查看');
				else{
					alert('下载失败!!!');
				}
			},
			error: function(){
				alert('下载失败!!!');
			}
	   });
	}
}
//显示悬浮层
function showInform(event, furl) {
	var info = document.getElementById("inform");
    $("#thum_Img").attr("src", furl);   
	var x = event.clientX / 10 + 15;
	var y = event.clientY / 10 - 4;
	var top = parseInt(info.offsetTop); 
	var left = parseInt(info.offsetLeft); 
	top = (y + top) * 10;
	left = (x + left) * 10;
	top = top + "px";
	left = left + "px";
	$("#inform").css({"top":top,"left":left});
	info.style.display = 'block';
}
//隐藏悬浮层
function hiddenInform(event) {
	$("#inform").css({"top":"10px","left":"10px"});
	var informDiv = document.getElementById('btn');
	var x = event.clientX;
	var y = event.clientY;
	var divx1 = informDiv.offsetLeft;
	var divy1 = informDiv.offsetTop;
	var divx2 = informDiv.offsetLeft + informDiv.offsetWidth;
	var divy2 = informDiv.offsetTop + informDiv.offsetHeight;
	if(x < divx1 || x > divx2 || y < divy1 || y > divy2) {
		document.getElementById('inform').style.display = 'none';
		$("#thum_Img").attr("src", "../../static/thum_img/blankBg.png"); 
	}
}

//图片显示
function showImg(furl) {
	/*var url ="http://192.168.25.175/"+furl;*/
	console.log(furl+"------------furl");
    $("#big_thum_img").attr("src", furl);   
	document.getElementById("big_thum").style.display = 'block';
	document.getElementById("div_img").style.display = 'block';
}

//显示小图片
function noShowImg() {
	document.getElementById("big_thum").style.display = 'none';
	document.getElementById("div_img").style.display = 'none';
}
//音乐播放=====

//显示播放控件
function showJplayMusic(furl, fname) {
	document.getElementById("musicPlay").style.display = 'block';
	jplayMusic(furl, fname);
}
//隐藏播放控件，并停止播放
function noShowJplayMusic() {
	document.getElementById("musicPlay").style.display = 'none';
}

//播放控件
function jplayMusic(furl, fname) {
	fname = fname + "(点击这里隐藏)";
	$(document).ready(function(){
		$("#jquery_jplayer_1").jPlayer({
			ready: function (event) {
				$(this).jPlayer("setMedia", {
					title: fname,
					mp3:furl,
					oga:furl
				});
			},
			swfPath: "../../jplayer",
			supplied: "m4a, oga",
			wmode: "window",
			useStateClassSkin: true,
			autoBlur: false,
			smoothPlayBar: true,
			keyEnabled: true,
			remainingDuration: true,
			toggleDuration: true
		});
	});
}
//视频控件
function playVideo(furl, fname) {
	/*var url ="http://image.stodger/"+furl;
	window.open("/file/videoPlay?furl="+url+"&fname="+fname);*/
	window.open("http://image.stodger.club/video/"+fname);
}








