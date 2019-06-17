<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>jsp使用方法</title>
</head>
<body>
<!-- 包含头部页面 -->
<%@ include file="Header.jsp" %><!-- 注意文件名区分大小写 -->

<div>	
	<h1>jsp使用方法</h1>
	<h2>1.直接嵌入java代码</h2>
	
	<span>运算结果：<%=10+5 %></span>
	<h2>2,嵌入java代码，方法调用</h2>
	<!--嵌入方法，注意语法  -->
	<%!	
	public float add(float a,float b){
		return a+b;
	}
	public int add(int a,int b)
	{
		return a+b;
	}	
	%>
	<%
	//JAVA CODE
	int a=8,b=9;
	out.println("调用方法1 result="+add(a,b));	
	out.write("调用方法2 result="+add(1.5f,5.0f));	
	%>	
	<h2>3,表单提交,会话对象session</h2>
	<p>session对象用来永久存储有关用户会话的所有信息	</p>	
	<h2>用户登录</h2>	
	<form action="doAction.jsp"   method="GET">
			用户名: <input type="text"   name="name"><br/><br/>
	
			密码: <input type="password"    name="pwd" /><br/>
			<input type="submit" value="提交" />			
	</form>
	<%
			String info=(String)request.getAttribute("login_erro");	
			if (info!=null){
				out.println("<p>request对象临时存储会话信息："+info+"</p>");
			}
	%>
	<h2>4，全局对象application</h2>
	<p> application的范围是从服务器一开始执行服务到服务器关闭为止
     application的范围最大,停留的时间最长,所以要使用application要注意,甚至要限制使用,
     不然可能会造成服务器负载越来越重,导致服务器奔溃的情况。
	 </p>
	<%
	//获取项目路径
	String path=application.getContextPath();
	//获取项目参数
	String author=application.getInitParameter("author");
	//输出对象
	out.println(path+"<br>");
	out.println(author+"<br>");
	%>
	<h2>5,使用Cookie保存登录信息</h2>
	<%//获取请求中的Cookie，以数组方式保存
		Cookie[] cookies=request.getCookies();
	    
	    String value=null;
		//循环遍历数组，得到key=uname的Cookie
		for(int i=0;i<cookies.length;i++){
			Cookie cookie=cookies[i];
			if (cookie.getName().equals("userName")){//判断Cookie的名称
				//获取key对应的value，输出显示
				value=cookie.getValue();	
				
			}
		}
		out.println("上次登录用户："+value);
	%>
	<H2>6,当前页面获取，pageContext对象</H2>
	<p>pageContext范围只在当前页面内有效，即pageContext对象已经不能获得另一个页面传递过来的数据</p>
	<%
		pageContext.setAttribute("userName", "admin");
	%>
	<%
		pageContext.setAttribute("userPwd", "123");
	%>
	<!--  显示页面-->
	<p>这里使用pageContext对象设置了属性和值</p>
	<br>请到另一个页面看看是否可以显示这些值
	<br>
	<a href="pageContextDemo.jsp">到另外一个页面</a>
	<hr>
	<p>当前页面获取pageContext对象</p>
	<%
		String userName = (String) pageContext.getAttribute("userName");
	%>
	<%
		String userPwd = (String) pageContext.getAttribute("userPwd");
		out.println("userName=" + userName + ";userPwd =" + userPwd);
	%>
	
	<br>

</div>
<!-- 包含底部页面 -->
<%@include file="Footer.jsp" %>
</body>
</html>