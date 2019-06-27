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
	<nav class="navbar navbar-default">	
  <div class="container-fluid" >
    <div class="navbar-header" style="margin-left: 100px;">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">觅密酒店</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">国内酒店 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">国外酒店</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">酒店相关 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">特卖专区</a></li>
            <li><a href="#">旗下品牌</a></li>
            <li><a href="#">美居</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">积分专区</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">优惠抢购</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">查询</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
      	<li><img src="client.getPhoto" id="photo" class="img-circle" width="30px"height="30px" style="position: relative;top: 10px;cursor:pointer"/></li>
      	<p class="navbar-text">${sessionScope.client.name}</p>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人设置 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">查看订单</a></li>
            <li><a href="#">设置</a></li>
            <li><a href="#">退出</a></li>
            <p class="navbar-text" >积分数量:${sessionScope.client.jifen}</p>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<script type="text/javascript">
	$(function(){
		$("#photo").click(function(){
			location.href="client.ChangeMessage";
		});
	});
</script>
</body>
</html>