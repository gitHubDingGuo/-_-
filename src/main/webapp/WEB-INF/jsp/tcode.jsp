<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>Bootstrap 实例 - 模态框（Modal）插件</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript"src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <link href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css">
</head>
<body>

<!-- <h2>创建模态框（Modal）</h2> -->
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="button2" >
	<!-- 开始演示模态框 -->
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<span style="font-size: 30px;color:blue">${userName}</span>给您加密分享了文件
				</h4>
			</div>
			<div class="modal-body">
				请输入提取码<br/>
				<input type="text" name="tcode" id="tcode"/>
				<input type="hidden" name="url" id="url" value="${url}"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="Tcode()">
					提取文件
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
$("#button2").hide();
$('#button2').trigger("click");
function Tcode(){
	var tcode = $("#tcode").val();
	var url =$("#url").val();
	$.ajax({
		type:'post',
		url:"/netdisc/share/inputTcode.action?time="
			+ new Date().getTime(),
		data:{
			tcode:tcode,
			url:url
		},
		dataType:'json',
		success:function(data){
			if(data.ok){
				layer.msg("提取码正确",{
					icon: 1,
					time: 16000,})
				
				window.location.href="/netdisc/share/sharefile.action?name="+ url+"&time="+new Date().getTime();
			}
			else layer.msg("提取码错误",{
				icon: 2,
			});
			
		},
	});
 
}

</script>

</html>