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

header {
	margin-bottom: 100px;
}
</style>
	</head>

	<body>
		<header>
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/index.jsp"><span
							class="glyphicon glyphicon-home"></span>NKU 403</a>
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
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#myRegister">
									Register
								</button>
							</form>
						</s:if>
						<s:else>

							<ul class="nav navbar-nav navbar-right">

								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false"><s:property
											value="#session.user.userName" /> <span class="caret"></span>
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
				<div class="col-sm-2">
					<div class="list-group">
						<a href="${pageContext.request.contextPath}/context/adminpage/libraryadmin.jsp" class="list-group-item"> <span
							class="glyphicon glyphicon-home"></span> &nbsp;标签管理 </a>
						<a href="${pageContext.request.contextPath}/context/adminpage/librarybook.jsp" class="list-group-item active"> <span
							class="glyphicon glyphicon-hom"></span> &nbsp;图书管理 </a>
					</div>
				</div>
				<!--<p><img src="<s:property value="#request.select"/>" width="100px" height="100px"/> </p>
				--><div class="col-sm-10">
					<div class="panel-group" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne"> 添加图书
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<form action="addBook" method="post" enctype="multipart/form-data">
										<div class="form-group">
											<label for="bookname">
												图书名称:
											</label>
											<input type="text" class="form-control"
												id="bookname" placeholder="bookName" name="book.bookName">
										</div>
										
										<div class="form-group">
											<label for="bookAuthor">
												作者:
											</label>
											<input type="text" class="form-control"
												id="bookAuthor" placeholder="bookAuthor" name="book.bookAuthor">
										</div>
										
										<div class="form-group">
											<label for="bookPress">
												出版社:
											</label>
											<input type="text" class="form-control"
												id="bookPress" placeholder="bookPress" name="book.bookPress">
										</div>
										
										<div class="form-group">
											<label for="bookPressTime">
												出版时间:
											</label>
											<input type="text" class="form-control"
												id="bookPressTime" placeholder="bookPressTime" name="book.bookPressTime">
										</div>
										
										
										<div class="form-group">
											<label for="bookISBN">
												ISBN:
											</label>
											<input type="text" class="form-control"
												id="bookISBN" placeholder="bookISBN" name="book.bookIsbn">
										</div>
										
										
										<div class="form-group">
											<label for="bookPicture">
												图书封面:
											</label>
											<input type="file"
												id="bookPicture" name="upload">
										</div>
										
										<div class="form-group">
											<label for="bookType">
												所属类型:
											</label>
											<s:action name="getAllType" executeResult="false" />
											<select class="form-control" id="bookType" name="booktype" >
												<s:iterator id="type" value="#request.allType">
												<option value="${type.getTypeId() }">
													${type.getTypeName() }
												</option>
												</s:iterator>
											</select>
										</div>
										
										<div class="form-group">
											<label for="bookInfo">
												图书描述:
											</label>
											<textarea  class="form-control"
												id="bookInfo" placeholder="bookInfo" name="book.bookInfo" rows="3"></textarea>
										</div>
										
										<div class="form-group">
											<label for="bookFindNumber">
												索书号:
											</label>
											<input type="text" class="form-control"
												id="bookFindNumber" placeholder="bookFindNumber" name="book.bookFindNumber">
										</div>
										
										<div class="form-group">
											<label for="bookTotalAmount">
												馆藏量:
											</label>
											<input type="text" class="form-control"
												id="bookTotalAmount" placeholder="bookTotalAmount" name="book.bookTotalAmount">
										</div>
										
										<div class="form-group">
											<label for="bookAccessAmount">
												可借量:
											</label>
											<input type="text" class="form-control"
												id="bookAccessAmount" placeholder="bookAccessAmount" name="book.bookAccessAmount">
										</div>
										<button type="submit" class="btn btn-default">确定</button>
									</form>
								</div>
							</div>
						</div>
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										查找图书  </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">
									<s:action name="getAllType" executeResult="false"></s:action>
									<table class="table table-hover">
										<tr>
											<th>类型序号</th>
											<th>类型名称</th>
											<th>移除</th>
										</tr>
										<s:iterator id="type" value="#request.allType">
										<tr><td>${type.getTypeId()}</td><td>${type.getTypeName()}</td><td><a href="#"><span class="glyphicon glyphicon-remove"></span></a></td></tr>
										</s:iterator>
									</table>
								</div>
							</div>
						</div>
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										归还图书 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									<form>
										<div class="form-group">
											<label for="bookId">
												借书id
											</label>
											<input type="text" class="form-control"
												id="bookId" placeholder="bookId" name="bookId">
										</div>
										
										<div class="form-group">
											<label for="userId">
												用户id
											</label>
											<input type="text" class="form-control"
												id="userId" placeholder="userId" name="userId">
										</div>
										
										<button type="button" class="btn btn-default" onclick="returnBook()">确定</button>
									</form>
								</div>
							</div>
						</div>
						<!--<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										Collapsible Group Item #3 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">
									Anim pariatur cliche reprehenderit, enim eiusmod high life
									accusamus terry richardson ad squid. 3 wolf moon officia aute,
									non cupidatat skateboard dolor brunch. Food truck quinoa
									nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt
									aliqua put a bird on it squid single-origin coffee nulla
									assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft
									beer labore wes anderson cred nesciunt sapiente ea proident. Ad
									vegan excepteur butcher vice lomo. Leggings occaecat craft beer
									farm-to-table, raw denim aesthetic synth nesciunt you probably
									haven't heard of them accusamus labore sustainable VHS.
								</div>
							</div>
						</div>
					--></div>
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
				
			<script>
				alertAdd();
				function alertAdd(){
					<% 
						if(request.getAttribute("addsuccess") == "success"){
						%>
							alert("添加成功");
						<%
						}
					%>
				}
				
				function returnBook(){
					$.get("returnBook",
					{
						bookId: $("#bookId").val(),
						userId: $("#userId").val()
					},
					function (data){
						if(data.retinfo == "nouser"){
							alert("借书人id不存在");
						}else if(data.retinfo == "nobook"){
							alert("图书id不存在");
						}else if(data.retinfo == "noborrow"){
							alert("不存在借书人或图书");
						}else if(data.retinfo == "success"){
							alert("归还成功");
							$("#bookId").val("");
							$("#userId").val("");
						}
					},
					"json"
					);
					
				}
			</script>
	</body>
</html>