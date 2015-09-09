
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<title>Demo</title>
<link
	href="http://cdn.bootcss.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>Product</h1>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">Product List</div>
			<div class="panel-body">
				<div id="product"></div>
			</div>
		</div>
	</div>

	<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.bootcss.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<script
		src="http://cdn.bootcss.com/handlebars.js/1.3.0/handlebars.min.js"></script>


	<script>
	var url;
		$(document).ready(function() {

			$("button").click(function() {
				$(".panel-heading").css("background-color", "blue");
			
				  getData('http://localhost:8080/Test001/ws/rest/customer/'+$("#t1").val());
			});
		});	
	</script>
	<script type="text/x-handlebars-template" id="product_table_template">

    {{#if data}}
        <table class="table table-hover" id="product_table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>sex</th>
                    <th>age</th>
                    <th>address</th>
                </tr>
            </thead>
            <tbody>
                {{#data}}
                    <tr data-id="{{id}}" data-name="{{name}}" data-sex="{{sex}}" data-address="{{address}}"  data-age="{{age}}" >
                        <td>{{id}}</td>
                        <td>{{name}}</td>
                        <td>{{sex}}</td>
                        <td>{{age}}</td>
                        <td>{{address}}</td>
                    </tr>
                {{/data}}
            </tbody>
        </table>
    {{else}}
        <div class="alert alert-warning">Can not find any data!</div>
    {{/if}}
</script>

	<script>
	   
		function getData(url) {
			$.ajax({
						type : 'get',
						url : url,
						dataType : 'json',
						success : function(data) {
							var template = $("#product_table_template").html();
							var render = Handlebars.compile(template);
							var html = render({
								data : data
							});
							$('#product').html(html);
						}
					});
		};
	</script>
	<input type="text" id="t1" />
	<button type="button" onclick="genUrl()">點擊 me</button>
</body>
</html>
