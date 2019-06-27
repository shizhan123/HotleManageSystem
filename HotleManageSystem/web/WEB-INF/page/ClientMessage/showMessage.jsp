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
	.fontSize{
				font-size: 25px;
			}
	.fontSize1{
		font-size:20px ;
		position: relative;
		top: -40px;
		left: 120px;
	}
	.photo{
	position: relative;
		top: -40px;
		left: 120px;
	}
	.mycontainer{
		position: relative;
		left: 50px;
		top:20px;
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
<div class="mycontainer">
  <div class="form-group">
    <p class="fontSize">当前头像 :</p>
    <img alt="" class="photo" src="client.getPhoto" width="100px" height="100px" class="img-rounded">
  </div>
  <div class="form-group">
    <p class="fontSize">昵称 :</p>
    <p class="fontSize1">${sessionScope.client.name }</p>
  </div>
  <div class="form-group">
    <p class="fontSize">电话号码 :</p>
    <p class="fontSize1">${sessionScope.client.telephone }</p>
  </div>
  <div class="form-group">
    <p class="fontSize">邮箱 :</p>
    <p class="fontSize1">${sessionScope.client.email }</p>
  </div>
</div>  	
</body>
</html> 