<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_update.jsp -->
	<script type="text/javascript">
		function check(){
			if (f.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				f.passwd.focus()
				return false
			}
			return true
		}
	</script>
	<div align="center">
		<form name="f" action="member_updateUser.do" method="post" onsubmit="return check()">
			<input type="hidden" name="no" value="${member.no}" />
			<table border="1" width="600">
				<tr>
					<th colspan="2">회원수정</th>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${member.name}" readOnly>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="${member.id}" readOnly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" value="${member.passwd}"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="ssn1" value="${member.ssn1}" readOnly>-
					<input type="password" name="ssn2" value="${member.ssn2}" readOnly></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${member.email}"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="hp1" value="${member.hp1}" size="3" maxlength="3"> -
					<input type="text" name="hp2" value="${member.hp2}" size="4" maxlength="4"> -
					<input type="text" name="hp3" value="${member.hp3}" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<input type="text" name="grade" value="${member.grade}" readOnly>
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
