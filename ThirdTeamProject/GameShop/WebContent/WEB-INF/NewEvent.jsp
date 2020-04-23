<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
	<div>
		<input type="text" id="se1" placeholder="請輸入想搜尋的商品">
		<button id="search">查詢</button>
		<input type="button" id="query" value="所有商品">
	</div>
	<div>
		<span id="sp1"></span>
	</div>


	<div>
		<form>
			<table id="t1">
				
			</table>
			<input type="button" id="add" value="新增">
		</form>
	</div>
	<script type="text/javascript">

	$(document).on("click","#query",function() {
				$.ajax({
							url : "processevent/query",
							dataType : "json",
							type : "POST",
							success : function(response) {
								console.log(response);
								var txt = "<tr><th>商品編號<th>活動照片<th>活動名稱<th>活動內文<th>開始日期<th>結束日期<th colspan='2'>設定";
								for (let i = 0; i < response.length; i++) {
									txt += "<tr><td>"
											+ response[i].eventId;
									txt += "<td>"
											+ response[i].eventImage;
									txt += "<td>"
											+ response[i].productId;
									txt += "<td>"
											+ response[i].eventName;
									txt += "<td>"
											+ response[i].content;
									txt += "<td>"
											+ response[i].startDate;
									txt += "<td>"
											+ response[i].endDate;
									txt += '<td><input type="button" id="update" value="修改">';
									txt += '<td><input type="button" id="delete" value="刪除">';
								}
								$('#t1').html(txt);
							}
						});
			})


		$(document).on('click', '#add', function() {
			txt += "<tr><td><input type='text'>";
			txt += "<td id='img'><input type='file'>";
			txt += "<td><input type='text'>";
			txt += "<td><input type='text'>";
			txt += "<td><input type='text'>";
			txt += "<td><input type='text'>";
			txt += "<td><input type='text'>";			
			txt += '<td><input type="button" id="add1" value="送出">';
			txt += '<td><input type="button" id="delete" value="刪除">';
			$('#t1').append(txt);
		});
		$(document).on('click','#add1',function(){
			var $tr=$(this).parents("tr");
			var a = {};
			$tr.find("td input:text").each(function(i, e) {
				a[i] = e.value;
			})
			console.log(a);
			$.ajax({
					url:"",
					data:{},
					type:"",
					datatype:"",
					success:function(){


					}
				});

			})
		


	</script>
</body>
</html>