<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>响应语句：</h1>
<%
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	if (name.equals("admin")&&pwd.equals("123456")){
		//1,使用session保存用户会话信息，以键/值的方式，	将一个对象的值存放到session中
		session.setAttribute("login_user", name);
		//1,以key/value的形式创建Cookie
		Cookie cookie=new Cookie("userName",name);
		//保存kookie对象
		response.addCookie(cookie);
		//2,重定向跳转页面
		response.sendRedirect("main.jsp");	
	}else{
		//1,使用request保存用户会话信息
		/*request的范围是指在一个jsp网页发出请求到另外一个jsp页面之间,随后这个属性就失效了,
		设定Request范围的属性时,可以利用setAttribute()和getAttribute()方法。在页面间传递数据
		时，应使用请求转发，如果使用重定向,则会造成数据丢失
		*/
		request.setAttribute("login_erro", "登录错误：用户名或密码不正确！");		
		//2,请求转发跳转页面
		String path="index.jsp";		
		RequestDispatcher rd=request.getRequestDispatcher(path);
		rd.forward(request, response);
		//总结：请求转发跳转页面,地址栏不会变更,可以获取到之前的request的属性
		//响应重定向跳转页面,地址栏产生变更,不能获取之前的request的属性
	}		
%>
<p><a href="index.jsp">返回</a></p>   
</body>
</html>