<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- prod_list.jsp -->
<%@ include file="top.jsp"%>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var isDel = window.confirm("������ �����Ͻðڽ��ϱ�?")
		if (isDel){
			location.href="shop_prodDelete.do?pnum=" + pnum + "&pimage=" + pimage
		}
	}
</script>
<div align="center">
	<table border="1" width="100%" class="outline">
		<caption><h3>��ǰ���</h3></caption>
		<tr class="m2">
			<th>��ȣ</th>
			<th>��ǰ�ڵ�</th>
			<th>��ǰ��</th>
			<th>�̹���</th>
			<th>����</th>
			<th>������</th>
			<th>����</th>
			<th>����|����</th>
		</tr>
		<c:if test="${empty listProd}">
			<tr>
				<td colspan="8">��ϵ� ��ǰ�� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:forEach var = "dto" items = "${listProd}">
		<tr>
			<td>${dto.pnum}</td>
			<td>${dto.pcategory_fk}</td>
			<td>${dto.pname}</td>
			<td>
				<a href="shop_prodView.do?pnum=${dto.pnum}">
					<img src="resources/img/${dto.pimage}" width="40" height="40">
				</a>	
			</td>
			<td>${dto.price}</td>
			<td>${dto.pcompany}</td>
			<td>${dto.pqty}</td>
			<td>
				<a href="shop_prodUpdate.do?pnum=${dto.pnum}">����</a> | 
				<a href="javascript:checkDel('${dto.pnum}','${dto.pimage}')">����</a>
			</td>	
		</tr>	
		</c:forEach>		
	</table>
</div>

<%@ include file="bottom.jsp"%>











