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
	header{
		margin-bottom:100px;
	}

</style>
	</head>

	<body>
	<header>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><span class="glyphicon glyphicon-home"></span>NKU 403</a>
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
										<a href="#">用户中心</a>
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
		</header>

		<div class="container">
			<div class="row">
				<!-- 左侧导航栏 -->
				<div class="col-sm-2">
					<div class="list-group">
						<a href="${pageContext.request.contextPath}/context/user/userhome.jsp" class="list-group-item active"> <span class="glyphicon glyphicon-home"></span> &nbsp;个人信息 </a>
						<a href="${pageContext.request.contextPath}/context/user/currentbor.jsp" class="list-group-item"> <span class="glyphicon glyphicon-paperclip"></span> &nbsp;当前借阅 </a>
						<a href="${pageContext.request.contextPath}/context/user/historybor.jsp" class="list-group-item"> <span class="glyphicon glyphicon-cloud"></span> &nbsp;历史借阅 </a>
						<a href="${pageContext.request.contextPath}/context/user/moneypage.jsp" class="list-group-item"> 账目清单 </a>
						<a href="${pageContext.request.contextPath}/context/user/bookshelf.jsp" class="list-group-item"> <span class="glyphicon glyphicon-book"></span> &nbsp;书架 </a>
					</div>
				</div>
				
				<div class="col-sm-10">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span class="glyphicon glyphicon-home"></span> 首页
							</h3>
						</div>
						<s:action name="getHistory" id="history" ignoreContextParams="true"></s:action>
						<s:action name="curBorrow" id="curbor" ignoreContextParams="true"></s:action>
						<div class="panel-body">
							<p>用户名：<s:property value="#session.user.userName"/></p>
							<p>邮箱：<s:property value="#session.user.userEmail"/></p>
							<p>手机：<s:property value="#session.user.userPhone"/></p>
							<p>历史借阅次数:<s:property value="#request.hisList.size()"/></p>
							<p>可借最大数目:10</p>
							<p>当前借阅数目:<s:property value="#request.curBor.size()"/></p>
						</div>
					</div>

				</div>

			</div>
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
	</body>
</html>