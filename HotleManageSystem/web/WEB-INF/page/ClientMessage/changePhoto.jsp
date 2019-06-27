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
</head>
<body>
	<div class="form-group">
    <img alt="" class="photo" src="client.getPhoto" width="200px" height="200px" class="img-rounded">
  </div>
  <form action="client.changePhoto" method="post" enctype="multipart/form-data">
  		<img alt="" src="">
  		<input type="file" value="添加图片" name="file">
  		<input type="submit" value="提交"/>
  </form>
</body>
</html>