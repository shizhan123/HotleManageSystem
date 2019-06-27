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
<link rel="stylesheet" href="css/guide.css" />

<jsp:include page="/include/guideforLogin.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
				<li id="message" class="active" data-src="client.ShowMessage?message=clientMessage"> 
					<a href="#">
						<i class="glyphicon glyphicon-th-large"></i>
						个人信息 
					</a>
				</li>
				<li>
					<a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
						<i class="glyphicon glyphicon-cog"></i>
						账户管理
						<span class="pull-right glyphicon glyphicon-chevron-down"></span>
					</a>
					<ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
						<li data-src="client.ShowMessage?message=changeMessage"><a href="#"><i class="glyphicon glyphicon-user"></i>信息管理</a></li>
						<li data-src="client.ShowMessage?message=changePhoto"><a href="#"><i class="glyphicon glyphicon-th-list"></i>修改头像</a></li>
						<li data-src="client.ShowMessage?message=changePassword"><a href="#"><i class="glyphicon glyphicon-edit"></i>修改密码</a></li>
					</ul>
				</li>
				<li>
					<a href="./plans.html">
						<i class="glyphicon glyphicon-credit-card"></i>
						积分商城 
					</a>
				</li>
				<li>
					<a href="./grid.html">
						<i class="glyphicon glyphicon-globe"></i>
						消息中心
						<span class="label label-warning pull-right">5</span>
					</a>
				</li>
				<li>
					<a href="./charts.html">
						<i class="glyphicon glyphicon-calendar"></i>
						客服中心
					</a>
				</li>
				<li>
					<a href="#">
						<i class="glyphicon glyphicon-fire"></i>
						关于酒店
					</a>
				</li>
			</ul>
	</div>
 </div>
</div>
		<div style="position:absolute ;width:600px;height:600px; left: 650px; top:80px;border: 1px solid black; ">
           <iframe frameborder="0" scrolling="no"  src="client.ShowMessage?message=showMessage" width="500px" height="500px"></iframe>
        </div>   
</body>
<script type="text/javascript">
	$(function(){
		$("#systemSetting li").on("click",function(){
			var address = $(this).attr("data-src");
			$("iframe").attr("src",address);
		});
		
		$("#message").click(function(){
			var address = $(this).attr("data-src");
			$("iframe").attr("src",address);
		})
	});
</script>
</html>