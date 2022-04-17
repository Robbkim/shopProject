<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
<br><br>
<br>
<div align="center">
<font size=5><b> 회원 매출 조회</b></font>
<table border=1  width=500  height=250>
	<tr align=center>
		<td>회원번호</td>
		<td>회원성명</td> 
		<td>고객등급</td> 
		<td>매출</td>
	</tr>
	<c:forEach items="${listMember}" var="m">
		<tr align=center>
			<td>${m.no()}</td>
			<td>${m.name()}</td>
			<td>${m.grade()}</td>
			<td>${m.getSprice()}</td>
		</tr>
	</c:forEach>
</table>
</div>
</section>
