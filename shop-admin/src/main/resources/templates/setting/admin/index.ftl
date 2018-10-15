<@p.header title="admin">
<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/admincp.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
<link href="${base}/res/css/skin_0.css" rel="stylesheet" type="text/css" id="cssfile2" />
</@p.header>

<body>
<div class="page">
<#--
  <div class="fixed-bar">
    <div class="item-title">
      <h3>权限设置</h3>
          
	      <ul class="tab-base">
		      <li><a class="current"><span>管理员</span></a></li>
		      <li><a href="${base}/setting/admin/add"><span>添加管理员</span></a></li>
		      <#--<li><a href="#?act=admin&amp;op=gadmin"><span>权限组</span></a></li>
		      <li><a href="#?act=admin&amp;op=gadmin_add"><span>添加权限组</span></a></li>
	      </ul>  
	     
      </div>
  </div>
   -->  
  <div class="fixed-empty"></div>
        
      	<form id="admin-form" method="post" action="" name="queryListForm">
       		<input type="hidden" name="pageNo" id="pageNum" value="${pageNo}"/>
        	<input type="hidden" name="div" id="div" value = "#dataListDiv"/>
      	</form>
   
        <div style="width:100%;" id="dataListDiv"></div>
	</div>
	
	</body>
	<script type="text/javascript">
	/*界面初始化*/
	$(function(){
		initDataList();
	});
	
	//初始化
	function initDataList(){
		var div = "#dataListDiv";//显示的list 数据div id 必须传递 
		$.ajax({
            async:false,
            url:"${base}/setting/admin/list",//默认加载list 页面
            data:{div:div},
            error:function(){frameControl.lhDgFalInfo("通讯失败!");},
            dataType:'html',
            type: "POST",
			contentType:"application/x-www-form-urlencoded; charset=utf-8", 
            success: function(data){
				$(div).empty();
				$(div).html(data);
				$(div).hide();
				$(div).fadeIn(300);
			}
        });
	}
	
	</script>
