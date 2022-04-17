<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cate_list.jsp -->
<%@ include file="top.jsp"%>
<div align="center">
	<table border="1" width="500">
		<caption><h3>카테고리 목록</h3></caption>
		<tr bgcolor="yellow">
			<th width="20%">번호</th>
			<th width="30%">카테고리코드</th>
			<th width="30%">카테고리이름</th>
			<th width="20%">삭제</th>
		</tr>
		<c:if test="${empty listCate}">
			<tr>
				<td colspan="6">등록된 카테고리가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${listCate}">
			<tr>
				<td>${dto.cnum}</td>
				<td>${dto.code}</td>
				<td>${dto.cname}</td>
				<td><a href="shop_cateDelete.do?cnum=${dto.cnum}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="bottom.jsp"%>