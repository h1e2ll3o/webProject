<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<table>
		<tr>
			<td width="178" height="450" background="./images/bg_left_rect.jpg">
				<div align=center>
					<iframe frameborder="0" width="160" height="440" src="./main_profile.html"></iframe>
				</div>
			</td>
			<td width="480" height="450" background="./images/bg_center_rect.jpg">
				<div align=center>
					<form action="./photoAction.jsp" method="post">
						<table width = "400" border = "0" cellpadding = "1" cellspacing = "10">
							<tr>
								<td colspan="2" style="text-align:center">
								<font face="굴림" style="font-size:15pt;">사진첩</font>
								</td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input type="text" name="subject" placeholder="최대 20자" size="33" maxlength="20"/></td>
							</tr>
							<tr>
								<td>내용</td>
								<td ><textarea name="content" placeholder="최대 290자" cols="32" rows="8" maxlength="290"></textarea></td>
							</tr>
							<tr>
								<td>사진 선택</td>
								<td><input type="file" name="savefilename" accept=".jpg, .bmp, .png, .gif"/></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:center"><input type="submit" value="등록"/></td>
							</tr>
						</table>
					</form>
				</div>
			</td>
			<td>
				<%--카테고리 디자인 변경 --%>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/home.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./profile.jsp'" src="./images/profile.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./diary_total.jsp'" src="./images/diary.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./photo.jsp'" src="./images/photo.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./comment.jsp'" src="./images/comment.jpg"/><br><br><br><br><br><br>
			</td>
		</tr>
	</table>
</body>
</html>