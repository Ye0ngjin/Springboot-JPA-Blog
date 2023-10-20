<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	text-align: center;
}
</style>
</head>
<body>
<h1>VOTEPOSTS 출력상태확인</h1>

<table width="1000", cellspacing="0" border="1">
	<tr>
		<th>num</th>
		<th>user_id</th>
		<th>choiceSub</th>
		<th>choice_1</th>
		<th>choice_2</th>
		<th>choice1_count</th>
		<th>choice2_count</th>
		<th>created_at</th>
		<th>isend</th>
	</tr>
	<tr>
		<td>1</td>
		<td>${voteDto.user_id }</td>
		<td>${dto.choiceSub }</td>
		<td>4</td>
		<td>5</td>
		<td>6</td>
		<td>7</td>
		<td>8</td>
		<td>9</td>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.num }</td>
		<td>2</td>
		<td>${dto.choiceSub }</td>
		<td>${dto.choice_1 }</td>
		<td>${dto.choice_2 }</td>
		<td>${dto.choice1_count }</td>
		<td>${dto.choice2_count }</td>
		<td><time datetime="YYYY-MM-DD">${dto.created_at }</time></td>
		<td>${dto.isend }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>