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
.right{
	text-align:right;
}
.button-group{
	float:right;
}
</style>
	</head>

	<body>
	<header>
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
										<a href="${pageContext.request.contextPath}/context/user/userhome.jsp">用户中心</a>
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
			<div class="panel panel-primary">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<h3 class="panel-title">书目信息</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-2">
							<p class="right">书名：</p>
							<p class="right">作者：</p>
							<p class="right">出版社：</p>
							<p class="right">出版时间：</p>
							<p class="right">ISBN：</p>
							<p class="right">所属类别：</p>
							<p class="right">索书号：</p>
							<p class="right">馆藏数量：</p>
							<p class="right">历史借阅量：</p>
							<p class="right">描述：</p>
						</div>
						<div class="col-lg-8">
							<p><s:property value="#request.book.bookName"/></p>
							<p><s:property value="#request.book.bookAuthor"/></p>
							<p><s:property value="#request.book.bookPress"/></p>
							<p><s:property value="#request.book.bookPressTime"/></p>
							<p><s:property value="#request.book.bookIsbn"/></p>
							<p><s:property value="#request.type"/></p>
							<p><s:property value="#request.book.bookFindNumber"/></p>
							<p><s:property value="#request.book.bookTotalAmount"/></p>
							<p><s:property value="#request.book.bookAccessAmount"/></p>
							<p><s:property value="#request.book.bookHistroy"/></p>
							<p><s:property value="#request.book.bookInfo"/></p>
						</div>
						<div class="col-lg-2">
							<img src="<s:property value="#request.book.bookPicture" />" width="120px" height="200px"/>
						</div>
					</div>
					
					<hr>
					
					<div class="button-group">
						<button class="btn btn-primary" onclick="borBook(<s:property value='#request.book.bookId' />)">借阅</button>
						<button class="btn btn-info">预约</button>
						<button class="btn btn-warning" onclick="shoucang(<s:property value='#request.book.bookId' />)">收藏</button>
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
		<%
			if(session.getAttribute("user") != null){
       			out.println("var login = true;");
       		}
          	else
          	{
            	out.println("var login = false;");
          	}
		%>
	function shoucang(bookId) {
		alert(bookId);
			if(!login){
				alert("请先登录再收藏");
				return;
			}
			
			$.get("addToBookStore",
				{
					"bookId" : bookId
				},
				function (data){
					if(data.info == "exist"){
						alert("您已经收藏了这本书了");
					}else if(data.info == "success"){
						alert("收藏成功");
					}
				},
				"json"
			);
		}
			
			function borBook(bookId){
				alert(bookId);
			if(!login){
				alert("请先登录再借阅");
				return;
			}
			
			$.get("borrowBook",
				{
					"bookId" : bookId
				},
				function (data){
					if(data.borinfo == "exist"){
						alert("您已经借阅这本书了");
					}else if(data.borinfo == "success"){
						alert("借阅成功");
					}else if(data.borinfo == "less"){
						alert("已经没有书可以借了 请尝试预约");
					}
				},
				"json"
			);
			}
</script>
	</body>
</html>
