<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- updateForm.jsp -->
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
		<form name="f" action="board_update.do" method="post" onsubmit="return check()">
			<input type="hidden" name="num" value="${param.num}"/>
			<table border="1" width="500">
				<tr bgcolor="yellow">
					<th colspan="2">글 수 정</th>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">이 름</th>
					<td width="80%"><input type="text" name="writer" value="${getBoard.writer}"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">제 목</th>
					<td width="80%"><input type="text" name="subject" size="53" value="${getBoard.subject}"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">Email</th>
					<td width="80%"><input type="text" name="email" size="53" value="${getBoard.email}"></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">내 용</th>
					<td width="80%"><textarea name="content" rows="10" cols="50">${getBoard.content}</textarea></td>
				</tr>
				<tr>
					<th width="20%" bgcolor="yellow">비밀번호</th>
					<td width="80%"><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글수정">
						<input type="reset" value="다시작성">
						<input type="button" value="목록보기" onclick="window.location='board_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
