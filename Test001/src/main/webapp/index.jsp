
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Demo</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
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
<script src="http://cdn.bootcss.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/handlebars.js/1.3.0/handlebars.min.js"></script>

<script type="text/x-handlebars-template" id="product_table_template">
    {{#if data}}
        <table class="table table-hover" id="product_table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>type</th>
                </tr>
            </thead>
            <tbody>
                {{#data}}
                    <tr data-id="{{pid}}" data-name="{{name}}" data-type="{{type}}">
                        <td>{{pid}}</td>
                        <td>{{name}}</td>
                        <td>{{type}}</td>
                    </tr>
                {{/data}}
            </tbody>
        </table>
    {{else}}
        <div class="alert alert-warning">Can not find any data!</div>
    {{/if}}
</script>

<script>
    $(function() {
        $.ajax({
            type: 'get',
            url: 'http://166.111.130.47/cloud/staging/bdpe-rest-service/projects',
            dataType: 'json',
            success: function(data) {
                var template = $("#product_table_template").html();
                var render = Handlebars.compile(template);
                var html = render({
                    data: data
                });
                $('#product').html(html);
            }
        });
    });
</script>

</body>
</html>
