<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cate_list.jsp -->
<%@ include file="top.jsp"%>
<div align="center">
	<table border="1" width="500">
		<caption><h3>ī�װ� ���</h3></caption>
		<tr bgcolor="yellow">
			<th width="20%">��ȣ</th>
			<th width="30%">ī�װ��ڵ�</th>
			<th width="30%">ī�װ��̸�</th>
			<th width="20%">����</th>
		</tr>
		<c:if test="${empty listCate}">
			<tr>
				<td colspan="6">��ϵ� ī�װ��� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${listCate}">
			<tr>
				<td>${dto.cnum}</td>
				<td>${dto.code}</td>
				<td>${dto.cname}</td>
				<td><a href="shop_cateDelete.do?cnum=${dto.cnum}">����</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="bottom.jsp"%>