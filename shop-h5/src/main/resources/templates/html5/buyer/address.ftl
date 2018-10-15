<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<title>地址管理</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
</head>

<body class="order_bg">
<div class="user_bar">
	<a class="back" href="${base}/m/authc/buyer/serviceCenter">
		<img src="${base}/res/html5/images/back_black.png" width="30" height="30" />
	</a>
	<span class="fl">地址管理</span>
	<span class="fr">
		<a href="${base}/m/authc/buyer/addressAdd?page=2&cartIds=0" >+新增</a>
	</span>
</div>

<div class="main">
  <div class="mt50" style="height:49px;"></div>
  <div class="address_list">
          <#assign addresslist = newTag("addressTag") />
          <#assign addresslist = addresslist("") />
					<#list addresslist as address>
				  	    <dl>
						      <dt id="${address.addressId}" >
						        <h3>
							        <b>
							           ${address.mobPhone}
							        </b>
							        <strong>
							           ${address.trueName}
							        </strong>
							    </h3>
						        <span style="font-size: 14px">
						               ${address.address}<br>${address.areaInfo}
						        </span>
						      </dt>
						      <dd>
						          <a href="javascript:void(0);" onClick="deleteAddress('${address.addressId}');" class="address_list_edit">
							          <span>
							             <img src="${base}/res/html5/images/user_del.png" style="width:100%">
							          </span>
							          <b>
							                                            删除
							          </b>
						          </a>
						      </dd>
				    </dl>
	      </#list>
    </div>
</div>
<!--底部-->
  <@f.foot/>		

<!--按钮-->

</body>
<script>
jQuery(document).ready(function(e) {
	//地址更新
    jQuery(".address_list dt").click(function(){
		var id = jQuery(this).attr("id");
		window.location.href="${base}/m/authc/buyer/updateAddress?page=2&cartIds=0&id="+id;
	});
  
});<!--end-->

//地址删除
function deleteAddress(id){
    var url = "${base}/m/authc/buyer/deleteAddress?id="+id+"&cartIds=0";
    //layer.confirm('确定删除?', function(){
        $.ajax({
            type: "post",
            url: url,
            data: null,
            dataType: "json",
            async:false,
            success:function(data) {
                if(data.success == "true"){
                	window.location.href = "${base}/m/authc/buyer/address";
                }else{
                	layer.open({content: '删除失败', time: 1});
                }
            }
        });
   // });
}
</script>
</html>
