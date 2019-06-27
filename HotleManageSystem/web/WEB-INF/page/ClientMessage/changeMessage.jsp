<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<form method="post" action="clientRegister" >
	   <div class="form-group">
	    <label for="exampleInputPassword1">昵称</label>
	    <input type="text" class="form-control" id="name" value="${sessionScope.client.name }" name="name">
	  </div>
	    <div class="form-group">
	    <label for="exampleInputPassword1">手机号码</label>
	    <input type="text" class="form-control" id="telephone" value="${sessionScope.client.telephone }" name="telephone">
	  </div>
	   <div class="form-group">
	    <label for="exampleInputPassword1">邮箱</label>
	    <input type="text" class="form-control" id="email" value="${sessionScope.client.email }"  name="email">
	  </div>
	  <button type="button" class="btn btn-primary" id="button" >修改</button>
	  <button type="reset" id="reset" class="btn btn-primary">重置</button>
	 </form>	
</div>
	 
</body>
<script type="text/javascript">
         $("#button").click(function(){ 
	 		var name = $("#name").val();
	 		var telephone = $("#telephone").val();
	 		var email = $("#email").val();
	 		$.ajax({
	 			type:"POST",
	 			url:"client.updateMessage",
	 			traditional:true,
	 			data:{
	 				"name":name,
	 				"telephone":telephone,
	 				"email":email
	 			},
	 			dataType:"json",
	 			success:function(data){
	 				if(data.message == "success"){
	 					alert("修改信息成功!");
	 					location.href="client.ShowMessage?message=showMessage";
	 					parent.location.reload(); //子页面刷新父页面
	 				}else{
	 					alert("修改失败！");
	 				}
	 			},
	 			error:function(data){
	 				alert("系统内部错误，ajax提交失败!");
	 			}
	 		});
         });
	 </script>
</html>