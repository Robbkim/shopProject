<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->

	<script type="text/javascript">
		function check(){
			if (f.writer.value==""){
				alert("이름을 입력해 주세요!!")
				f.writer.focus()
				return false
			}
			if (f.subject.value==""){
				alert("제목을 입력해 주세요!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("내용을 입력해 주세요!!")
				f.content.focus()
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
		<form name="f" action="reboard_write.do" method="post" onsubmit="return check()">
			<input type="hidden" name="num" value="${num}"/>
			<input type="hidden" name="re_step" value="${re_step}"/>
			<input type="hidden" name="re_level" value="${re_level}"/>
			<table border="1" width="500">
				<tr bgcolor="yellow">
					<th colspan="2">글 쓰 기</th>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">이 름</th>
					<td width="80%"><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">제 목</th>
					<td width="80%"><input type="text" name="subject" size="53"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">Email</th>
					<td width="80%"><input type="text" name="email" size="53"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">내 용</th>
					<td width="80%"><textarea name="content" rows="10" cols="50"></textarea></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">비밀번호</th>
					<td width="80%"><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글쓰기">
						<input type="reset" value="다시작성">
						<input type="button" value="목록보기" onclick="window.location='reboard_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
