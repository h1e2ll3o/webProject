<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR");%>
<script>
	function check(f){
		var subject = f.subject.value;
		var savefile = f.savefile.value;
		
		if(subject.length == 0){
			f.subject.focus();
			return false;
		}
		if(savefile.lengh==0){
			return false
		}else{
			//Ȯ���� Ȯ��
			var dot = savefilename.lastIndexOf(".");
			var ext = savefilename.substr(dot+1);
			ext = ext.toLowerCase();
			
			if(ext == "png" || ext == "jpg" || ext == "gif" || ext == "bpm"){
				return true;
			}else{alert(".png, .jpg, .gif, .bpm Ȯ���ڸ� �����մϴ�."); return false;}
		}
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	table.type05 {
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin: 20px 10px;
	}
	table.type05 th {
	  width: 150px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	  background: #EFEFEF;
	}
	table.type05 td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
</style>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<table>
		<tr>
			<td width="480" height="450" background="./images/bg_center_rect.jpg">
				<div align=center>
					<form action="photoWriteAction.jsp" method="post" enctype="Multipart/form-data" onsubmit="return check(this)">
						<table class="type05" >
							<tr>
								<td colspan="2" style="text-align:center">
								<font face="����" style="font-size:15pt;">����ø</font>
								</td>
							</tr>
							<tr>
								<th scope="row">����</th>
								<td><input type="text" name="subject" placeholder="�ִ� 20��" size="33" maxlength="20"/></td>
							</tr>
							<tr>
								<th scope="row">����</th>
								<td ><textarea name="contents" placeholder="�ִ� 290��" cols="32" rows="8" maxlength="290"></textarea></td>
							</tr>
							<tr>
								<th scope="row">���� ����</th>
								<td><input type="file" name="savefile" accept=".jpg, .bmp, .png, .gif"/></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:center"><input type="submit" value="���"/></td>
							</tr>
						</table>
					</form>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>