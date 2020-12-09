<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8" %>
<%@ page import="UserDatabase.userDAO" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<script type="text/javascript">
		function checkValue(){
			if(!document.userInfo.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(!document.userInfo.pw.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if(document.userInfo.pw.value != document.userInfo.checkPW.value){
				alert("비밀번호가 서로 맞지 않습니다.");
				return false;
			}
			if(!document.userInfo.email1.value){
				alert("이메일을 입력하세요.");
				return false;
			}
		}
	</script>
	
</head>
<style>
	td{padding: 5px;}
</style>
<body>

<h1 align="center"><b>회원가입</b></h1>
<div class="content" align="center">
	<form action="signupAction.jsp" method="POST" name="userInfo" onsubmit="return checkValue()">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" maxlength="15"/></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pw" maxlength="15"/></td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td><input type="password" name="checkPW"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" maxlength="15"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email1"/> @
				<select name="email2">
					<option>vision.hoseo.edu</option>
					<option>naver.com</option>
					<option>gmail.com</option>
					<option>nate.com</option>
				</select></td>
			</tr>
			<tr>
				<td>블로그 이름</td>
				<td><input type="text" name="blog" maxlength="20"/></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><input type="submit" value="등록" /></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>