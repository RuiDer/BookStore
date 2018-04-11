<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="common.jsp" %>
<%@ page import="java.util.*" %>
<jsp: useBean id="cart"  scope="session" class="mypack.ShoppingCart"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>付款</title>
</head>
<%@ include file="banner.jsp" %>
<body>
	<p> 您共购买了<%=((ShoppingCart)request.getAttribute("cart")).getNumberOfItems()%>本书 </p>
	<p>您应支付金额为<%=((ShoppingCart)request.getAttribute("cart")).getTotal() %>元</p>
	
	<form action="<%=request.getContextPath()%>/receipt.jsp" method="POST">
	<table>
	<tr>
	<td><strong>信用卡用户名</strong></td>
	<td><input type="text" name="cardname" value="guest"  size="19"></td>
	</tr>
	<tr>
	<td><strong>信用卡账号</strong></td>
	<td><input type="text" name="cardnum" value="#### #### #### ####"  size="19"></td>
	</tr>
	
	<tr>
	<td><input type="submit" value="递交"></td>
	</tr>
	</table>
	</form>
</body>
</html>