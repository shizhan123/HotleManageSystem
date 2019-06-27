<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<script type="text/javascript" src="js/bootstrap.min.js" ></script>	
	<style>
			.container{
				width: 400px;
				height: 400px;
				margin-top: 50px;
				margin-left: 50px;
			}
			#reset{
				margin-left: 315px;
				margin-top: -55px;
			}
			
		</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<form method="post" action="clientRegister" >
	   <div class="form-group">
	    <label for="exampleInputPassword1">旧密码</label>
	    <input type="password" class="form-control" id="oldpassword"  name="oldpassword">
	  </div>
	    <div class="form-group">
	    <label for="exampleInputPassword1">新密码</label>
	    <input type="password" class="form-control" id="newpassword"  name=""newpassword"">
	  </div>
	   <div class="form-group">
	    <label for="exampleInputPassword1">再输入一次</label>
	    <input type="password" class="form-control" id="oncenewpassword"  name="oncenewpassword">
	  </div>
	  <button type="button" class="btn btn-primary" id="button" >修改</button>
	  <button type="reset" id="reset" class="btn btn-primary">重置</button>
	 </form>	
</div>
</body>
<script type="text/javascript">
	var old = $("#oldpassword");
	var news = $("#newpassword");
	var once = $("#oncenewpassword");
	$("#button").click(function(){
	 if(news.val() != once.val()){
		 alert("两次输入不正确,请重新输入");
	  }else{
		$.ajax({
			type:"POST",
			url:"client.updatePassword",
			traditional:true,
			data:{
				"old":old.val(),
				"news":news.val()
			},
			dataType:"json",
			success:function(data){
 				if(data.message == "success"){
 					alert("修改信息成功!");
 					location.href="client.ShowMessage?message=showMessage";
 					parent.location.reload(); //子页面刷新父页面
 				}else if(data.message == "error"){
 					alert("旧密码输入错误！");
 				}else{
 					alert("修改失败！");
 				}
 			},
 			error:function(data){
 				alert("系统内部错误，ajax提交失败!");
 			}
		});
	  }
	});
</script>
</html>