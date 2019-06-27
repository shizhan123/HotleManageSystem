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
 <form method="post" action="clientRegister" >
	  <div class="form-group">
	    <label for="exampleInputEmail1">账号</label>
	    <input type="text" class="form-control" id="username" placeholder="ID" name="username"/>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">密码</label>
	    <input type="password" class="form-control" id="password" placeholder="Password" name="userpassword">
	  </div>
	   <div class="form-group">
	    <label for="exampleInputPassword1">姓名</label>
	    <input type="text" class="form-control" id="name" placeholder="Name" name="name">
	  </div>
	  
	    <div class="form-group">
	    <label for="exampleInputPassword1">电话</label>
	    <input type="text" class="form-control" id="telephone" placeholder="Telephone" name="telephone">
	  </div>
	  <button type="button" class="btn btn-primary" id="button" onclick="registeronclick()">注册</button>
	  <button type="reset" id="reset" class="btn btn-primary">重置</button>
	 
 </form>
</div> 
	<script type="text/javascript">
      function registeronclick(){
    	 var username = $("#username").val();
    	 var password = $("#password").val();
    	 var name = $("#name").val();
    	 var telephone = $("telephone").val();
		 $.ajax({
			 type:"POST",
			 url:"clientRegister",
			 traditional:true,
			 data:{
				 "username":username,
				 "userpassword":password,
				 "name":name,
				 "telephone":telephone
			 },
			 dataType:"json",
			 success:function(data){
				 if(data.message == "success"){
					 alert("注册成功");
					 location.href="clientLogin.jsp";
				 }else if(data.message =="wrong"){
					 alert("该用户名已存在，注册失败!");
				 }
			 },
			 error:function(data){
					alert("系统内部错误，ajax提交失败");
				}
		 });
      }
	</script>

</body>
</html>