<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Header.jsp" %>
	<div>
	<H1>主页面</H1>
	<h2>1,使用session,获取用户会话信息</h2>
	<%	
		//根据键名称获取session中存放对象的值
		String userName=(String)session.getAttribute("login_user");
		out.write("<p>登录用户："+userName+"</p>");
	%>
	
	</div>
	<%@include file="Footer.jsp" %>
</body>
</html>