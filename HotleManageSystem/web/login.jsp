<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="js/bootstrap.min.js" ></script>	
		<style type="text/css">
			.container{
				width: 500px;
				height: 400px;
				margin-top: 200px;
			}
			#reset{
				margin-left: 415px;
				margin-top: -55px;
			}
		</style>
		<%	
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +     
							request.getServerPort() +
							request.getContextPath() + "/";
%>
<base href="<%=basePath%>">
</head>
<body>
	<div class="container">		
	<form  method="post" action="Login">
  <div class="form-group">
    <label for="exampleInputEmail1">账号</label>
    <input type="text" class="form-control" id="id" placeholder="ID" name="id"/>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">密码</label>
    <input type="password" class="form-control" id="password" placeholder="Password" name="password">
  </div>
  <button type="submit" class="btn btn-primary" id="button">登录</button>
  <button type="reset" id="reset" class="btn btn-primary">重置</button>
</form>
</div> 
<script type="text/javascript">
	/*	var b = document.getElementById("button");
		var id = document.getElementById("id");
		var password = document.getElementById("password");
		$(function(){
			$("#button").click(function(){
				$.ajax({
					type:"post",
					url:"Login",
					data:{"id":id,"password":password},
					dataType:"application/json",
					error:function(){
						alert("输入失败，请重新输入");
					},
					success:function(){
						alert("登录成功!");
					},
					async:true
				});
			});
		});*/
	</script>
</body>
</html>