<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- list.jsp -->
	<div align="center">
		<b>글 목 록</b>
		<c:if test="${member.id == 'admin'}">
		<table border="0" width="800">
			<tr bgcolor="yellow">
				<td align="right"><a href="board_write.do">글쓰기</a></td>
			</tr>
		</table>
		</c:if>
		<table border="1" width="800">
			<tr bgcolor="green">
				<th>번호</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
				<th>IP</th>
			</tr>
		<c:if test="${empty listBoard}">
			<tr>
				<td colspan="6">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${listBoard}">
			<tr>
				<td>${dto.num}</td>
				<td>
				<c:if test="${member.id == 'admin'}">
					<a href="board_content.do?num=${dto.num}">${dto.subject}</a>
				</c:if>
				<c:if test="${member.id != 'admin'}">
					${dto.subject}
				</c:if>		
				</td>
				<td>${dto.writer}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.readcount}</td>
				<td>${dto.ip}</td>
			</tr>
		</c:forEach>
		</table>
	</div>






