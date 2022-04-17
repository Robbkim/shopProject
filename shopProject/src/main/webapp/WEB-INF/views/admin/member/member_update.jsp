<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_update.jsp -->
	<div align="center">
		<form name="f" action="member_update.do" method="post" onsubmit="return check()">
			<input type="hidden" name="no" value="${getMember.no}" />
			<table border="1" width="600">
				<tr>
					<th colspan="2">회원수정</th>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${getMember.name}" readOnly>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="${getMember.id}" readOnly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" value="${getMember.passwd}" readOnly></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="ssn1" value="${getMember.ssn1}" readOnly>-
					<input type="password" name="ssn2" value="${getMember.ssn2}" readOnly></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${getMember.email}" readOnly></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="hp1" value="${getMember.hp1}" size="3" maxlength="3" readOnly> -
					<input type="text" name="hp2" value="${getMember.hp2}" size="4" maxlength="4" readOnly> -
					<input type="text" name="hp3" value="${getMember.hp3}" size="4" maxlength="4" readOnly></td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<input type="text" name="grade" value="${getMember.grade}">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
