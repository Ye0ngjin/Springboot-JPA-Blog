<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 생성</title>
</head>
<body>
	<%
		session.setAttribute("abc", 123);
		session.setAttribute("name", "kim");
		
	%>

	<a href="sessionGet.jsp">세션값 확인</a>
</body>
</html>