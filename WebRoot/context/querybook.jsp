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
					<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;NKU 403</a>
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
			<div class="col-lg-12">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="重新查找">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button> </span>
				</div>
				<!-- /input-group -->
			</div>
			</div>
			<br>
			<br>
			<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						共检索到图书${request.bookList.size() }本
					</h3>
				</div>
				<div class="panel-body">
				<s:iterator id="bookList" value="#request.bookList">
				<div class="row">
					<div class="col-lg-1">
						<img src="<s:property value="#bookList.bookPicture"/>" height="120px" width="80px" />
					</div>
					<div class="col-lg-9">				
						<p><a href="findSingleBook?bookId=<s:property value="#bookList.bookId" />"><s:property value="#bookList.bookName"/> <s:property value="#bookList.bookFindNumber"/></a> </p>
						<p><s:property value="#bookList.bookAuthor"/></p>
						<p><s:property value="#bookList.bookPress"/></p>
						<P><s:property value="#bookList.bookPressTime"/></P>	
					</div>
					
					<div class="col-lg-2">
						<p>馆藏复本:<s:property value="#bookList.bookTotalAmount"/></p>
						<p>当前可借:<s:property value="#bookList.bookAccessAmount"/></p>
					</div>
				</div>
				<hr>
				</s:iterator>
						<nav>
							<ul class="pager">
								<li class="previous disabled">
									<a href="#"><span aria-hidden="true">&larr;</span> Older</a>
								</li>
								<li class="next">
									<a href="#">Newer <span aria-hidden="true">&rarr;</span>
									</a>
								</li>
							</ul>
						</nav>
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
