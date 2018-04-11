<%@page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="common.jsp" %>
<%@ page import="java.util.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>书籍信息</title>
</head>
<%@ include file="banner.jsp" %>
<br>
<%
String bookId=request.getParameter("bookId");
if(bookId==null)  bookId="201";
BookDetails book=((BookDB)request.getAttribute("bookDB")).getBookDetails(bookId);
%>
<%
if(book==null){%>
<p>书号"<%=bookId %>在数据库中不存在"</p>
<strong><a href="<%=request.getContextPath() %>/catalog.jsp>">继续购物 </a> </strong>
<% return;}%>

<p>书名：<%=convert(book.getTitle()) %></p>
作者：<em> <%=convert(book.getName()) %></em>&nbsp;&nbsp;
(<%=book.getYear() %>)<br>
<p>价格（元）：<%=book.getPrice() %> </p>
<p>销售数量:<%=book.getSaleAmount() %>  </p>
<p> 评论:<%=convert(book.getDescripyion()) %> </p>

<p> <strong> <a href="<%=request.getContextPath() %>/catalog.jsp?Add=<%=bookId %> ">加入购物车

</a>&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath() %>/catalog.jsp>"> 继续购物 </a>
</strong></p>
	
</body>
</html>