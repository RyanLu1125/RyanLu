<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/ckeditor5/18.0.0/classic/ckeditor.js"></script>
<meta charset="UTF-8">
<title>Event</title>
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				<!-- <tr>
					<td>活動內文 : <div id="editor" name="content"></div></td>
				</tr> --> 
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

	//CKEditor 文字編輯器
	
      //  ClassicEditor
       //     .create( document.querySelector( '#editor' ) )
      //      .catch( error => {
      //          console.error( error );
      //      } );
    
	
	//ShowAllEvent
	$(document).on("click","#queryall",function() {
		console.log('QueryAll:1');
			$.ajax({
					url : "queryAllEvent",					
					dataType : "json",
					type : "GET",					
					success : function(response) {
						console.log('queryResopnse',response);
						//console.log('QueryAll:2');
						var txt = "<tr><th>活動編號<th>產品編號<th>活動照片<th>活動名稱<th>活動內文<th>開始日期<th>結束日期<th colspan='2'>設定";
						for (let i = 0; i < response.length; i++) {
							var id = response[i].eventId;
							txt += "<tr><td>"+ response[i].eventId;
							txt += "<td>"+ response[i].productId;					
							txt += "<td><img src='data:image/jpeg;base64," + response[i].eventImage + "'>"						
							txt += "<td>"+ response[i].eventName;
							txt += "<td>"+ response[i].content;
							txt += "<td>"+ response[i].startDate;
							txt += "<td>"+ response[i].endDate;
							txt += '<td><input type="button" id="update" value="編輯">';
							txt += '<td><input type="button" id="delete" value="刪除" >';												
							//console.log('QueryAll:3');
						}
						$('#t1').html(txt);
						
						//console.log('QueryAll:4');
					}
				});
	})
	
	//addEvent
	$(document).on('click', '#add', function(){
			alert("新增成功");
		});
	
	//deleteEvent
	$(document).on('click', '#delete', function() {
		var checkstr = confirm("確定是否刪除?");
		if(checkstr == true){
			var $tr = $(this).parents("tr");
			var eventId = $tr.find("td").eq(0).text(); //抓取id值
			console.log('eventId='+eventId);
			$(this).parents("tr").remove();  //刪除整個欄位

			$.ajax({
				url : "deleteEvent",
				dataType : "json",
				type : "POST",
				data : {eventId : eventId},
				success : function(response) {
					console.log(response);									 
				},		
			});
			alert("刪除成功");
		}else{
			 return false;
			}			
		});
	

	//updateEvent
		$(document).on('click', '#update', function() {
			var $tr = $(this).parents("tr");
			var eventId = $tr.find("td").eq(0).text(); //抓取id值
			console.log('eventId='+eventId);
		




			
		//$.ajax({
		//		url : "",
		//		dataType : "json",
		//		type : "POST",
		//		data : {eventId : eventId},
				
		//		success : function(response) {
		//			console.log(response);										 
		//		},
			
		//	});		
		});
	</script>

	
</body>

</html>