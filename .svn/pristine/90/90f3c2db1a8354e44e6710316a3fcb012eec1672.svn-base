function cancel1(id) {
	if(confirm("确认取消分享？")) {
		$.ajax({
			url:"cancelShare.action?time="+ new Date().getTime(),
			type:"POST",
			contentType:"application/x-www-form-urlencoded",
			data:{sid:id},
			success:function(data) {
				alert(data);
				if( data == "取消成功") window.close();
			},
			error:function() {
				alert("取消分享出错");
			}
		});
	 }
}

function login(uid) {
	if( uid == null || uid.trim() == '' ) {
		alert("请先登录");
		return false;
	}
	else alert("保存成功");
}