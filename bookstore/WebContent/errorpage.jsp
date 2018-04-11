<%@page import="java.io.*" %>

<%@page isErrorPage="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Error Page</title>
</head>
<body>
	<p>
		服务器发生错误：<%=exception.getMessage() %>
	</p>
	<p>
		错误原因:<% exception.printStackTrace(new PrintWriter(out)); %>
	</p>
</body>
</html>