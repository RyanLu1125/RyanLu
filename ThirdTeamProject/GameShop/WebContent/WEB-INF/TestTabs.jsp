<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>Event Tabs Test</title>
<script>
	$(function() {
		$("#tabs-nav a").click(function() {
			$("#tabs-nav a").removeClass("tabs-menu-active");
			$(this).addClass("tabs-menu-active");
			$(".tabs-panel").hide();
			var tab_id = $(this).attr("href");
			$(tab_id).show("blind");
			return false;
		});
	});
</script>
<style>
#tabs-nav {
	margin: 0;
	padding: 0;
	position: relative;
	text-align: left
}

a.tabs-menu {
	display: inline-block;
	background-color: #1b91ab;
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
	color: #fff;
	padding: 5px 10px;
	text-shadow: 1px 1px 0px #1b91ab;
	font-weight: bold;
	text-decoration: none;
	border: solid 1px #1b91ab;
	border-bottom: 0;
	border-radius: 3px 3px 0 0;
}

a.tabs-menu.tabs-menu-active {
	background-color: #fff;
	text-shadow: 1px 1px 0px #ffffff;
	border: solid 1px #1b91ab;
	color: #6b6b6b;
	border-bottom: 0;
}

.tabs-container {
	border: solid 1px #1b91ab;
	margin-top: -1px;
	background-color: #fff;
	overflow: hidden;
}

.tabs-panel {
	display: none;
	min-height: 400px;
	overflow: auto;
	padding: 10px;
	max-height: 600px;
}
</style>
</head>
<body>


	<div id="jquery-tabs" style="width: 900px;">
		<div id="tabs-nav">
			<a href="#tab0" class="tabs-menu tabs-menu-active">新增活動</a> <a
				href="#tab1" class="tabs-menu">查詢活動</a> <a href="#tab2"
				class="tabs-menu">暫時存放</a>
		</div>

		<div class="tabs-container" style="height: auto;">

			<div id="tab0" class="tabs-panel" style="display: block;">
				<h2>新增活動</h2>
				<form action="addEvent" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>活動起始時間 : <input type="date" id="startDate"	name="startDate"></td>
						</tr>
						<tr>
							<td>活動結束時間 : <input type="date" id="endDate" name="endDate"></td>
						</tr>
						<tr>
							<td>活動圖檔 : <input type="file" id="imageUpload"	name="eventImage" multiple="multiple" accept=".png, .jpg, .jpeg" />
							</td>
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
			</div>



			<div id="tab1" class="tabs-panel">
				<div>
					<table>
						<input type="text" id="se1" placeholder="請輸入想搜尋的活動編號">
						<button id="search">查詢</button>
						<button id="queryall">查詢所有活動</button>
					</table>

					<table id="queryAllEvent">
					</table>
				</div>


				<div class="container">
					
					<!-- Button to Open the Modal -->
					

					<!-- The Modal -->
					<div class="modal" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h5 class="modal-title">修改活動資料</h5>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">Modal body..
								
								<form action="updateEvent" method="post" enctype="multipart/form-data" >
									<table id="updateEvent">
										<tr>
											<td>活動起始時間 : <input type="date" id="startDate" name="startDate1"></td>
										</tr>
										<tr>
											<td>活動結束時間 : <input type="date" id="endDate" name="endDate1"></td>
										</tr>
										<tr>
											<td>活動圖檔 : <input type="file" id="imageUpload" name="eventImage1" multiple="multiple" accept=".png, .jpg, .jpeg"/><img  name="eventImage2" alt="" src="">	</td>
										</tr>
										<tr>
											<td>產品編號 <input type="text" name="productId1"></td>
										</tr>
										<tr>
											<td>活動標題 : <input type="text" name="eventName1"></td>
										</tr>
										<tr>
											<td>活動內文 : <input type="text" name="content1"></td>
										</tr>	
									<!-- <tr>
											<td>活動內文 : <div id="editor" name="content"></div></td>
										</tr> --> 
														
									</table>		
								</form>
								
																												
								</div>
								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-success"data-dismiss="modal">OK</button>
									<button type="button" class="btn btn-danger"data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div id="tab2" class="tabs-panel"></div>

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
											console.log('queryResopnse',
													response);
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
												txt += '<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="updateData">修改</button>';
												
												txt += '<td><button type="button" class="btn btn-danger" id="delete">刪除</button>';
												//console.log('QueryAll:3');
											}
											$('#queryAllEvent').html(txt);

											//console.log('QueryAll:4');
										}
									});
						})

		//addEvent
		$(document).on('click', '#add', function() {
			alert("新增成功");
		});

		//deleteEvent
		$(document).on('click', '#delete', function() {
			var checkstr = confirm("確定是否刪除該活動?");
			if (checkstr == true) {
				var $tr = $(this).parents("tr");
				var eventId = $tr.find("td").eq(0).text(); //抓取id值
				console.log('eventId=' + eventId);
				$(this).parents("tr").remove(); //刪除整個欄位

				$.ajax({
					url : "deleteEvent",
					dataType : "json",
					type : "POST",
					data : {
						eventId : eventId
					},
					success : function(response) {
						console.log(response);
					},
				});
				alert("刪除成功");
			} else {
				return false;
			}
		});

		//updateEvent
		$(document).on('click', '#updateData', function() {
			var $tr = $(this).parents("tr");
			var eventId = $tr.find("td").eq(0).text(); //抓取id值
			console.log('eventId=' + eventId);

			$.ajax({
					url : "queryEvent",
					dataType : "json",
					type : "GET",
					data : {eventId : eventId},

					success : function(response) {
						console.log(response);	
						$('input[name="startDate1"]').val(response.startDate);
						$('input[name="endDate1"]').val(response.endDate);								
						$('input[name="productId1"]').val(response.productId);
						$('input[name="eventName1"]').val(response.eventName);	
						$('input[name="content1"]').val(response.content);	
						$('img[name="eventImage2"]').attr("src","data:image/jpeg;base64,"+response.eventImage+"");
												 
					},

				});		
		});
	</script>
</body>
</html>