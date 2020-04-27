<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Event</title>
</head>

<body>
		<div>
		<h2>新增活動</h2>
		<form action="addEvent" method="post" enctype="multipart/form-data" >
			<table>
				<tr>
					<td>活動起始時間 : <input type="date" id="startDate" name="startDate"></td>
				</tr>
				<tr>
					<td>活動結束時間 : <input type="date" id="endDate" name="endDate"></td>
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
			<table>
				<input type="text" id="se1" placeholder="請輸入想搜尋的活動編號">
				<button id="search">查詢</button>
				<button id="queryall">查詢所有活動</button>
				
											
			</table>
			<table id="t1" >
			</table>		
		</div>
	</div>
	
	<script type="text/javascript">

	

	
	<!--ShowAllEvent-->
	$(document).on("click","#queryall",function() {
		console.log('QueryAll:1');
			$.ajax({
					url : "queryAllEvent",					
					dataType : "json",
					type : "GET",					
					success : function(response) {
						console.log('queryResopnse',response);
						console.log('QueryAll:2');
						var txt = "<tr><th>活動編號<th>產品編號<th>活動照片<th>活動名稱<th>活動內文<th>開始日期<th>結束日期<th colspan='2'>設定";
						for (let i = 0; i < response.length; i++) {
							var id = response[i].eventId;
							txt += "<tr><td id='" +id+ "' class='eventId'>"+ response[i].eventId;
							txt += "<td>"+ response[i].productId;					
							txt += "<td><img src='data:image/jpeg;base64," + response[i].eventImage + "'>"						
							txt += "<td>"+ response[i].eventName;
							txt += "<td>"+ response[i].content;
							txt += "<td>"+ response[i].startDate;
							txt += "<td>"+ response[i].endDate;
							txt += '<td><button   class="update" name="update1" >修改</button>';
							txt += '<td><button   class="delete" name="delete1" onclick="deleteEvent()">刪除</button>';							
							console.log('QueryAll:3');
						}
						$('#t1').html(txt);
						console.log('QueryAll:4');
					}
				});
	})
	
	<!--deleteEvent-->
	function deleteEvent(){
		var name = $(".delete").siblings("td.delete").attr('name');
		window.alert("測試:"+name);
		}

	
	</script>

</body>

</html>