<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/context/css/bootstrap.min.css">
  </head>
  
  <body>
		<form action="LoginAction" method="post">

			<form>
				<div class="form-group">
					<label>
						用户名：
					</label>
					<input type="text" class="form-control" name="userName"
						placeholder="Email" />
						<span><s:fielderror> 
								<s:param>userName </s:param> 
							  </s:fielderror> </span>
				</div>
				<div class="form-group">
					<label>
						密码：
					</label>
					<input type="password" class="form-control"
						name="userPassword" placeholder="Password"/>
				</div>
				<div class="form-group">
					<label>
						确认密码：
					</label>
					<input type="password" class="form-control"
						name="rePassword" placeholder="Password"/>
				</div>
				<div class="form-group">
					<label>
						邮箱：
					</label>
					<input type="email" class="form-control"
						name="userEmail" placeholder="Password"/>
				</div>
				<div class="form-group">
					<label>
						手机号：
					</label>
					<input type="text" class="form-control"
						name="userPhone" placeholder="Password"/>
				</div>

				<button type="submit" class="btn btn-default">
					Submit
				</button>
			</form>
		</form>
	</body>
</html>
