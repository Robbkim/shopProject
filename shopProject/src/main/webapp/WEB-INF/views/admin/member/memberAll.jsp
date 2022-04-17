<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!-- memberAll.jsp -->
	<div align="center">
		<hr color="green" width="300">
		<c:if test="${mode == 'all'}">
		<h2>회 원 목 록 보 기</h2>
		</c:if>
		<c:if test="${mode == 'find'}">
		<h2>회 원 찾 기</h2>
		<form name="f" method="post" action="memberAll.do">
			<input type="hidden" name="mode" value="${mode}"/>
			<select name="search">
				<option value="grade">등급</option>
				<option value="name">회원명</option>
			</select>
			<input type="text" name="searchString">
			<input type="submit" value="찾기">
		</form>
		</c:if>		
		<hr color="green" width="300">
		<table border="1" width="800">
			<tr bgcolor="yellow">
				<th>번호</th>
				<th>아이디</th>
				<th>회원명</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>등급</th>
				<th>수정 | 삭제</th>
			</tr>
		<c:if test="${empty listMember}">
			<tr>
				<td colspan="8">등록된(찾는) 회원이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${listMember}">
			<tr>
				<td>${dto.no}</td>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.email}</td>
				<td>${dto.allHp}</td>
				<td>${dto.joindate}</td>
				<td>${dto.grade}</td>
				<td><a href="member_update.do?no=${dto.no}">수정</a> | 
				<a href="member_delete.do?no=${dto.no}">삭제</a></td>
			</tr>
		</c:forEach>
		</table>
	</div>









