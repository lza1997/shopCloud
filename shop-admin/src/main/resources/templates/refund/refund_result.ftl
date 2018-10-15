<@layout.head>
<h1>

  	${msg}
</h1>
</@layout.head>
<script type="text/javascript">
var wait=5;
$(function() {
	time();
});
function time() {
	//console.log(wait);
	if(wait==0){
		location.href="${base}/orders/returnList";
	}else{
		var timeto = $("#timeto");
		timeto.html("(" + wait + "秒后返回首页)");
		wait--;
		setTimeout(function() {
			time();
		}, 1000);
	}
}
</script>