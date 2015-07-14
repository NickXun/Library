<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<meta name="description" content="NKU403">
		<meta name="author" content="NKU403">

		<title>NKU library</title>

		<!-- Bootstrap core CSS -->
		<link
			href="${pageContext.request.contextPath}/context/css/bootstrap.min.css"
			rel="stylesheet">


		<style>
@import
	url("//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css")
	;

.libraryimg {
	margin: 0 auto;
	width: 100%;
	padding: 0;
	height: 30%;
}

.libraryimg img {
	max-width: 100%;
	max-height: 500px;
}

.bottom-bar {
	weight: 100%;
	padding-top: 10px;
}

img {
	display: block;
	margin: 0 auto;
}

p {
	text-align: center;
	padding-top: 10px;
}

#sa {
	margin-top: 10px;
}

</style>
	</head>

	<body>

		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><span class="glyphicon glyphicon-home"></span> NKU 403</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<s:if test="%{#session.user == null}">
						<form class="navbar-form navbar-right" action="LoginAction"
							method="post">
							<div class="form-group">
								<input type="text" placeholder="username" class="form-control"
									name="user.userName">
							</div>
							<div class="form-group">
								<input type="password" placeholder="Password"
									class="form-control" name="user.userPassword">
							</div>
							<button type="submit" class="btn btn-success">
								Sign in
							</button>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#myRegister">
								Register
							</button>
						</form>
					</s:if>
					<s:else>
						
						<ul class="nav navbar-nav navbar-right">
							
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false"><s:property value="#session.user.userName" />
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<s:if test="%{#session.user.useright == 0}">
											<a href="${pageContext.request.contextPath}/context/user/userhome.jsp">用户中心</a>
										</s:if>
										<s:elseif test="%{#session.user.useright == 1}">
											<a href="${pageContext.request.contextPath}/context/adminpage/libraryadmin.jsp">管理</a>
										</s:elseif>
										<s:elseif test="%{#session.user.useright == 2}">
											<a href="${pageContext.request.contextPath}/context/adminpage/systemadmin.jsp">管理</a>
										</s:elseif>
									</li>
									<li>
										<a href="#">书架</a>
									</li>
								</ul>
							</li>
							<li>
								<s:url action="UserAction" method="logout" id="lout"></s:url>
								<!--<s:a href="%{#lout}">注销</s:a>-->
								<a href="UserAction!logout">注销</a>
							</li>
						</ul>
					</s:else>
				</div>
				<!--/.navbar-collapse -->
			</div>
		</nav>
		
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="libraryimg">
			<img
				src="${pageContext.request.contextPath}/context/img/nkulibrary.jpg"
				width="100%" />
		</div>
		<div class="container" id="sa">
			<div class="row">
				<div class="col-md-4">
					<div class="panel panel-info">
					<div class="panel-heading">
					<h3 align="center">
						每日
						<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
						一书
					</h3>
					</div>
					<div class="bottom-bar">
					<img src="${pageContext.request.contextPath}/context/img/book/2.jpg" width="180px" height="250px"  />
					
					<p>
						<a class="btn btn-primary"
							href="#" role="button">View
							details »</a>
					</p>
					</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-success">
					<div class="panel-heading">
					<h3 align="center">
						检索<span class="glyphicon glyphicon-search" aria-hidden="true"></span>馆藏
					</h3>
					</div>
					<div class="bottom-bar">
						
						<div class="col-lg-12">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Search for...">
								<span class="input-group-btn">
									<a href="findAllBook"><button class="btn btn-default" type="button">
									
										Go!
									</button></a> </span>
							</div>
							<!-- /input-group -->
						</div>
						<p></p>
						<p></p>
						<p></p>
						<p></p>
						<p></p>
					</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-danger">
					<div class="panel-heading">
					<h3 align="center">
						热门<span class="glyphicon glyphicon-fire" aria-hidden="true"></span>图书
					</h3>
					</div>
					<div class="bottom-bar">
						<table class="table">
   		 					<thead>
   		 						<tr>
   		 							<th>名次</th>
   		 							<th>书名</th>
   		 							<th>借阅次数</th>
   		 							<th>详情</th>
   		 						</tr>
   		 					</thead>
   		 					<tbody>
   		 						<tr>
   		 							<td>1</td><td>小黄书</td><td>10</td><td><a href="#"><span class="glyphicon glyphicon-list-alt"></span></a></td>
   		 						</tr>
   		 					</tbody>
  						</table>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myRegister" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title">
							注册
						</h4>
					</div>
					<div class="modal-body">
						<form action="RegisterAction" method="post">
							<div class="form-group">
								<label >
									用户名：
								</label>
								<input type="text" class="form-control" id="userName" name="userName"
									placeholder="6-11位字母或数字组合">
							</div>
							<div class="form-group">
								<label >
									密码：
								</label>
								<input type="password" class="form-control" id="userPassword" name="userPassword"
									placeholder="6-20位字母或数字">
							</div>
							<div class="form-group">
								<label >
									确认密码：
								</label>
								<input type="password" class="form-control" id="reuserPassword" name="rePassword"
									placeholder="与密码相同">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">
									邮箱：
								</label>
								<input type="email" class="form-control" id="userEmail" name="userEmail"
									placeholder="email">
							</div>
							<div class="form-group">
								<label>
									手机：
								</label>
								<input type="text" class="form-control" id="userPhone" name="userPhone"
									placeholder="phone">
							</div>
							<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							取消
						</button>
						<button type="submit" class="btn btn-primary">
							注册
						</button>
					</div>
						</form>
					</div>
					
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>


		<footer>
			<p align="center">
				© copyright NKU403 2015
			</p>
		</footer>
		<!-- /container -->

		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script
			src="${pageContext.request.contextPath}/context/js/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/context/js/bootstrap.min.js"></script>
		<script>
	function loginerror() {
		alert("用户名或密码错误");
	}
	
	
	function register(){
		userName = $("#userName").val();
		userPassword = $("#userPassword").val();
		reuserPassword = $("#reuserPassword").val();
		userEmail = $("#userEmail").val();
		userPhone = $("#userPhone").val();
		
		alert(userName);
		$.ajax({
              type: "POST",
              url: "login",
              data: {
                "userName": userName,
                "userPassword": userPassword,
                "userEmail":uerEmail,
                "userPhone":userPhone
              },
              success: function(json){
              	alert(2);
              },
              dataType: 'json'
            });
		
	}
		</script>

	</body>
</html>
