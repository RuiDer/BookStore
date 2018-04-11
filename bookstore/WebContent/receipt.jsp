<%@include file="common.jsp"%>
<jsp: useBean id="cart"  scope="session" class="mypack.ShoppingCart"/>

<%
	((BookDB)request.getAttribute("bookDB")).buyBooks(((ShoppingCart)request.getAttribute("cart")));
	session.invalidate();
%>