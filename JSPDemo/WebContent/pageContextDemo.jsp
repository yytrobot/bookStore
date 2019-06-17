<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		//获取属性值
		String userName = (String) pageContext.getAttribute("userName");
		String userPwd = (String) pageContext.getAttribute("userPwd");
		out.println("userName=" + userName + ";userPwd =" + userPwd);
	%>

</body>
</html>