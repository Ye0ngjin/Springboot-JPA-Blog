<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 확인</title>
</head>
<body>
	<%
		Object obj1 = session.getAttribute("abc");
		Integer intValue = (Integer)obj1;
		out.println("abc : " + intValue);
		
		Object obj2 = session.getAttribute("name");
		String StringValue = (String)obj2;
		out.println("name : " + StringValue);
		
	%>
	<br/>
	<%
		String sName;
		String sValue;
		Enumeration<String> en = session.getAttributeNames();
		
		// 브라우저상에는 아래의 세션에서 설정한 값들은 보이지 않는다.(보안상)
		while(en.hasMoreElements()){
			sName = en.nextElement();
			sValue = session.getAttribute(sName).toString();
			out.println("세션 이름 : " + sName + "<br/>");
			out.println("세션 값 : " + sValue + "<br/>");
		}
		
		out.println("===============================<br/>");
		
		// 세션 아이디
		String sessionID = session.getId();
		out.println("sessionID : " + sessionID + "<br/>");
		
		// 세션 유효시간(초 단위)
		int sessionInterval = session.getMaxInactiveInterval();
		out.println("세션 유효 시간 : " + sessionInterval + "초" + "<br/>");
		
   	 	out.println("===============================<br/>");
   	 	// 세션 특정 데이터 삭제
   	 	session.removeAttribute("abc");
   	 	
		Enumeration<String> en1 = session.getAttributeNames();
		 
		while(en1.hasMoreElements()){
			sName = en1.nextElement();
			sValue = session.getAttribute(sName).toString();
			out.println("세션 이름 : " + sName + "<br/>");
			out.println("세션 값 : " + sValue + "<br/>");
		}
		
		out.println("===============================<br/>");
		// 세션의 모든 데이터 삭제
		session.invalidate();
		
		// 유효한 세션 아이디 존재 여부
		if(request.isRequestedSessionIdValid()){
			out.print("session valid");
		}else{
			out.print("session Invalid");
		}
	%>
</body>
</html>