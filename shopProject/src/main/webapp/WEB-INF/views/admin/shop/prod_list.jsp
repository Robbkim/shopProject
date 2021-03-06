<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- prod_list.jsp -->
<%@ include file="top.jsp"%>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="shop_prodDelete.do?pnum=" + pnum + "&pimage=" + pimage
		}
	}
</script>
<div align="center">
	<table border="1" width="100%" class="outline">
		<caption><h3>상품목록</h3></caption>
		<tr class="m2">
			<th>번호</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>이미지</th>
			<th>가격</th>
			<th>제조사</th>
			<th>수량</th>
			<th>수정|삭제</th>
		</tr>
		<c:if test="${empty listProd}">
			<tr>
				<td colspan="8">등록된 상품이 없습니다.</td>
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
				<a href="shop_prodUpdate.do?pnum=${dto.pnum}">수정</a> | 
				<a href="javascript:checkDel('${dto.pnum}','${dto.pimage}')">삭제</a>
			</td>	
		</tr>	
		</c:forEach>		
	</table>
</div>

<%@ include file="bottom.jsp"%>











