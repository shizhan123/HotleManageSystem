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
</head>
<body>
<div class="container">		
 <form >
  <div class="form-group">
    <label for="exampleInputEmail1">账号</label>
    <input type="text" class="form-control" id="username" placeholder="ID" name="username"/>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">密码</label>
    <input type="password" class="form-control" id="password" placeholder="Password" name="userpassword">
  </div>
  <div class="form-group" id="vaidcode">
  	<label >验证码</label>
  	<input type="text" id="vaidCode" name="vaidCode" size="1" width="100px" ><img alt="" src="" width="100px" height="50px"> 
  	<a href="">看不清?</a></br>
  </div>
  <button type="button" class="btn btn-primary" id="button" onclick="loginonclick()">登录</button>
  <button type="reset" id="reset" class="btn btn-primary">重置</button>
</form>
<a href="#" onclick="zhuce()">注册</a>
</div> 
<script type="text/javascript">
	$("#vaidcode").hide();
	$(function(){
		$("#username").focus(function(){
			$("img").attr("src","vaidCode?data="+new Date());
			$("#vaidcode").show();
		});
		$("a").click(function(){
			$("img").attr("src","vaidCode?data="+new Date());
			return false;
		});
	});
</script>
<script type="text/javascript">
		function loginonclick(){
			var name = document.getElementById("username");
			var password = document.getElementById("password");
			var code = document.getElementById("vaidCode");
			$.ajax({
				type:"POST",
				url:"clientLogin",
				traditional:true,
				data:{
					"username":name.value,
					"userpassword":password.value,
					"vaidCode":code.value
				},
				dataType:"json",
				success:function(data){
					if(data.message == "success"){
						alert("登录成功");
						location.href="Hotle.jsp";
					}else if(data.message=="wrong"){
						alert("验证码输入错误！");
					}else{
						alert("账号或密码错误!");
					}
				},
				error:function(data){
					alert("系统内部错误，ajax提交失败");
				}
			});
		}
</script>
<script type="text/javascript">
	function zhuce(){
		location.href = "clientRegister.jsp";
	}
</script>
</body>
</html>