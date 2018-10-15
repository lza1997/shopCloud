<@layout.head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${base}/res/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${base}/res/js/template/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/template/admin.js"></script>
<script type="text/javascript">
$(function(){

	$("#browser").treeview({
		url: "v_tree"
	});
	Cms.lmenu("lmenu");
});
</script>

<title>模板</title>
</@layout.head>
<@layout.body>
<ul id="browser" class="filetree"></ul>

</@layout.body>