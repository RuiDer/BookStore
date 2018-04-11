<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="common.jsp" %>
<%@ page import="java.util.*" %>

<jsp: useBean id="cart"  scope="session" class="mypack.ShoppingCart">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车</title>
</head>
<%@ include file="banner.jsp" %>
<body>
	<%
		String bookId=request.getParameter("Remove");
		if(bookId!=null) { ((ShoppingCart)request.getAttribute("cart")).remove(bookId);
		BookDetails book=((BookDB)request.getAttribute("bookDB")).getBookDetails(bookId);
	%>
	
	<font color=  size="+2">您删除了一本书：<em> <%=convert(book.getTitle()) %></em>
	<br>&nbsp;<br>
	</font>
	
	<%
		}
		if(request.getParameter("Clear")!=null)
		{
			((ShoppingCart)request.getAttribute("cart")).clear();         //清空购物车
			%>
	<font color=  size="+2"><strong>
	清空购物车
	<br>&nbsp;<br></strong>
	</font>
	<% 
	}
		
	//计算购物车内的书的数量
	int nums=((ShoppingCart)request.getAttribute("cart")).getNuberOfItems();
	if(nums>0){
	%>
	
	<font size="+2">您的购物车内有<%=nums%>本书  </font><br>&nbsp;
	
	<table>
		<tr>
			<th align=left>数量</th>&nbsp;
			<th align=left>书名</th>&nbsp;
			<th align=left>价格</th>
		</tr>
	<%
		
			Iterator it=((ShoppingCart)request.getAttribute("cart")).getItems().iterator();
			while(it.hasNext()){
				ShoppingCartItem item=(ShoppingCartItem)it.next();
				BookDetails bd=(BookDetails)item.getItem();
			
			%>
			
	<tr>
	<td
		align="right" bgcolor="#ffffff">
		<%=item.getQuantity() %>
	</td>
	
	<td
		bgcolor="#ffffaa">
		<strong><a href="<%=request.getContextPath() %>/bookdetails.jsp?bookId=<%=bd.getBookId()%>">
		<%=convert(bd.getTitle()) %></a>></strong>>
	</td>
	
	<td align="right"  bgcolor="#ffffaa">
	<%=bd.getPrice() %>
	</td>
	
	<td bgcolor="#ffffaa">
	<strong>
	<a href="<%=request.getContextPath() %>/showcart.jsp?Remove=<%=bd.getBookId() %>">删除</a>
	</strong>
	</td></tr>
	
	
	<% } %>
	
	<tr><td colspan="5" bgcolor="#ffffff" ><br></td></tr>
	
	<tr>
	
	<td colspan="2"  algin="right"  bgcolor="#ffffff"> 总额(元) </td>
	<td   algin="right"  bgcolor="#ffffaa"> <%=((ShoppingCart)request.getAttribute("cart")).getTotal()%></td>
	<td><br></td>
	</tr>
	
	</table>
	
	<p>&nbsp;</p>
	<strong>
	<a href="<%=request.getContextPath() %>/cashier.jsp">付账</a>
	&nbsp;&nbsp;&nbsp;
	<a href="<%=request.getContextPath() %>/showcart.jsp?Clear=clear">清空购物车</a></strong>
	<%
	} else{
	%>
	
	<font size="+2">您的购物车为空</font>
	<br>&nbsp;<br>
	<a href="<%=request.getContextPath() %>/catalog.jsp">继续购物</a>
	<%  } %>
</body>
</html>