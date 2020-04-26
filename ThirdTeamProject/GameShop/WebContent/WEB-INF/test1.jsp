<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Event</title>
</head>

<body>
		<div>
		<h2>新增活動</h2>
		<form action="addEvent" method="post" enctype="multipart/form-data" >
			<table>
				<tr>
					<td>活動起始時間 : <input type="date" id="datepicker" name="startDate"></td>
				</tr>
				<tr>
					<td>活動結束時間 : <input type="date" id="datepicker" name="endDate"></td>
				</tr>
				<tr>
					<td>活動圖檔 : <input type="file" id="imageUpload" name="eventImage" multiple="multiple" accept=".png, .jpg, .jpeg"/>	</td>
				</tr>
				<tr>
					<td>產品編號 <input type="text" name="productId"></td>
				</tr>
				<tr>
					<td>活動標題 : <input type="text" name="eventName"></td>
				</tr>
				<tr>
					<td>活動內文 : <input type="text" name="content"></td>
				</tr>	
				<tr>
					<td><input type="submit" value="Send" id="add" /></td>
				</tr>				
			</table>		
		</form>
		
		<div>
			<table id="t1">
				<input type="text" id="se1" placeholder="請輸入想搜尋的活動名稱">
				<button id="search">查詢</button>
				<input type="button" id="queryall" class="queryall" value="查詢所有活動">								
			</table>
			<table id="t2">
			<tr>
				<td>test <td>
				<td>${Event}</td>
			</tr>
			</table>
	
		</div>
	</div>
	
	<script type="text/javascript">

	console.log($('#t2'))

	$(document).on("click","#queryall",function() {
			$.ajax({
					url : "queryAllEvent",
					dataType : "json",
					type : "POST",
					success : function(response) {
						console.log(response);
						var event = $[Event];
						var txt = "<tr><th>活動編號<th>產品編號<th>活動照片<th>活動名稱<th>活動內文<th>開始日期<th>結束日期<th colspan='2'>設定";
						for (let i = 0; i < response.length; i++) {
							txt += "<tr><td>"+ response[i].eventId;
							txt += "<td>"+ response[i].productId;
							txt += "<td>"+ response[i].eventImage;						
							txt += "<td>"+ response[i].eventName;
							txt += "<td>"+ response[i].content;
							txt += "<td>"+ response[i].startDate;
							txt += "<td>"+ response[i].endDate;
							txt += '<td><input type="button" id="update" value="修改">';
							txt += '<td><input type="button" id="delete" value="刪除">';
						}
						$('#t1').html(txt);
					}
				});
	})
	</script>

</body>

</html>