<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input.jsp -->
<html>
<head>
	<title>회원가입</title>
	<script type="text/javascript">
		function check(){
			if (f.id.value==""){
				alert("아이디를 입력해 주세요!!")
				f.id.focus()
				return false
			}
			if (f.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				f.passwd.focus()
				return false
			}
			return true
		}
	</script>
</head>
<body>
	<div align="center">
		<form name="f" action="member_input.do" method="post" onsubmit="return check()">
			<table border="1" width="600">
				<tr>
					<th colspan="2">회원가입</th>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${name}" readOnly>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="ssn1" value="${ssn1}" readOnly>-
					<input type="password" name="ssn2" value="${ssn2}" readOnly></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="hp1" size="3" maxlength="3"> -
					<input type="text" name="hp2" size="4" maxlength="4"> -
					<input type="text" name="hp3" size="4" maxlength="4"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="입력">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>