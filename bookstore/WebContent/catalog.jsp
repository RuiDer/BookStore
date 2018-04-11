<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ include file="common.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>菜单栏</title>
</head>
<%@ include file="banner.jsp" %>
<body>
	<p>  <a href="<%=request.getContextPath() %>/showcart.jsp">查看购物车</a> &nbsp; &nbsp; &nbsp;
	<a href="<%=request.getContextPath() %>/cashier.jsp">付账</a>
	 </p>
	 
	 <strong><p>请选择要购买的书：</p></strong>
	 <%
	 	Collection books=((BookDB)request.getAttribute("bookDB")).getBooks();
	 	Iterator it=books.iterator();
	 	while(it.hasNext())
	 	{
	 		BookDetails bd=(BookDetails)it.next();  %>
	 		<%=convert(bd.getTitle()) %>  <br>&nbsp;&nbsp;
	 		作者：<%=convert(bd.getName()) %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 		<p> <strong> <a href="<%=request.getContextPath() %>/catalog.jsp?Add=<%=convert(bd.getBookId()) %> ">加入购物车</strong></p>
	 <% }
	 %>
</body>
</html>