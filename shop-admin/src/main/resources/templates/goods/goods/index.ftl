<@p.header title="demo">
<script type="text/javascript" src="${base}/res/jquery.dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${base}/res/js/grid.js"></script>
<script type="text/javascript" src="${base}/res/js/commons.js"></script>
<script type="text/javascript" src="${base}/res/js/class.js"></script>
<link href="${base}/res/js/lib/jquery.dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
</@p.header>

<body>
	<div class="iframebox">
		<h3 class="cont-tit">商品</h3>
        <div class="control-mod">
            <form id="acct-form" method="post" action="" name ="queryListForm">
            	<input type="hidden" id="div" value = "#dataListDiv"/>
            	<input type="hidden" id="pageNo" />
            	<span class="col">商品名称<input type="text" name="goodsName" class="text" placeholder="输入" value="${goodsName}"/></span>
            	<span class="col">平台货号<input type="text" name="goodsCommonid" class="text" placeholder="输入" value="${goodsCommonid}"/></span>
            	<span class="col">分类<input type="text" name="" class="text" placeholder="输入" value=""/></span>
            	<br/>
            	<span class="col">所属店铺<input type="text" name="storeName" class="text" placeholder="输入" value="${storeName}"/></span>
            	<span class="col">
            	品牌
            	<select name="brandId">
            	<#if brandList??>
            		<option value="-1">请选择……</option>
            		<#list brandList as brand>
            			<option value="${brand.brandId}">${brand.brandName}</option>
            		</#list>
            	</#if>
            	</select>
            	</span>
            	<span class="col">
            	上架
            	<select name="goodsState">
            		<option value="-1">请选择……</option>
            		<option value="0">下架</option>
            		<option value="1">正常</option>
            		<option value="10">违规（禁售）</option>
            	</select>
            	</span>
            	<span class="col">
            	等待审核
            	<select name="goodsVerify">
            		<option value="-1">请选择……</option>
            		<option value="1">通过</option>
            		<option value="0">未通过</option>
            		<option value="10">审核中</option>
            	</select>
            	</span>
            	<br/>
            	<span class="col">
            		<button type="button" class="btng" onclick="sbQuery();">搜索</button>
                	<button type="button" class="btng" onclick="resetFm();">重置</button>
            	</span>
                
            </form>
        </div>
        <div style="width:100%;" id="dataListDiv"></div>
	</div>
	
</body>
<script type="text/javascript">
	/*界面初始化*/
    $(function(){
        initDataList();
        $(".rank2").each(function(){
            $(this).hide();
        });
    });
	
	//初始化
	function initDataList(){
		var div = "#dataListDiv";//显示的list 数据div id 必须传递 
		$.ajax({
            async:false,
            url:"${base}/goods/goods/list",//默认加载list 页面
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
	
	/**搜索方法***/
	function sbQuery(){
		var div = $("#div").val();
		var parma = $("#acct-form").serialize();
		$.ajax({
            async:false,
            url:"${base}/goods/goods/list",//默认加载list 页面
            data:parma,
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

		
	/*重置表单*/
	function resetFm(){$("#acct-form")[0].reset();}

	
	</script>
  
