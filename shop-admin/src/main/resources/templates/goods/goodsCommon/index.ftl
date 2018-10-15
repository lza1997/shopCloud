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
		<ul class="cont-tab">
		<!--
			<li class="cur"><a href="${base}/goods/type/index">类型属性</a></li>
		-->
			<li class="cur" id="li0"><a href="javascript:queryGoods(0);">所有商品</a></li>
        	<li id="li1"><a href="javascript:queryGoods(1);">违规下架</a></li>
        	<li id="li2"><a href="javascript:queryGoods(2);">等待审核</a></li>
        
        	<#--<li id="li3"><a href="javascript:setGoods();">商品设置</a></li>-->
        <!--
        	<li><a href="${base}/goods/goodsCommon/setGoods">商品设置</a></li>
		-->
		</ul>

        <div class="control-mod" id="control-mod">
            <form id="acct-form" method="post" action="" name ="queryListForm">
            	<input type="hidden" id="div" value = "#dataListDiv"/>
            	<input type="hidden" id="pageNo" />
            	<span class="col">商品名称<input type="text" name="goodsName" class="text" placeholder="输入" value="${goodsName}"/></span>
            	<span class="col">平台货号<input type="text" name="goodsCommonid" class="text" placeholder="输入" value="${goodsCommonid}"/></span>
            	<span class="col">分类
            		<select name="gcId1" onchange="changeGcId2(this)">
            			<#if classList??>
            			<option value="-1">请选择……</option>
            			<#list classList as class>
            			<option value="${class.gcId}">${class.gcName}</option>
            			</#list>
            			</#if>
            		</select>
            		<select name="gcId2" id="gcId2" onchange="changeGcId3(this)">
            			<option value="-1">请选择……</option>
            		</select>
            		<select name="gcId3" id="gcId3">
            			<option value="-1">请选择……</option>
            		</select>
            	</span>
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
            url:"${base}/goods/goodsCommon/list",//默认加载list 页面
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
            url:"${base}/goods/goodsCommon/list",//默认加载list 页面
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
	
	/*根据一级分类查询二级分类*/
	function changeGcId2(obj){
		var classId = obj.value;
		
		resetGcId2();
		resetGcId3();
		
		if(classId == -1){
		  return;
		}

		$.ajax({
            async:false,
            url:"${base}/goods/goodsCommon/findClassByParentId",
            data:{id:classId},
            error:function(){frameControl.lhDgFalInfo("通讯失败!");},
            dataType:'html',
            type: "POST",
			contentType:"application/x-www-form-urlencoded; charset=utf-8", 
            success: function(data){
            var jsonObj = eval("(" + data + ")");
            var classArray = eval("(" + jsonObj.result + ")");

			for ( var i = 0; i < classArray.length; i++) {
				var $option = $("<option></option>");
				$option.attr("value", classArray[i].gcId);
				$option.text(classArray[i].gcName);
				$("#gcId2").append($option);
			}
				
			}
        });
	}
	
	/*根据二级分类查询三级分类*/
	function changeGcId3(obj){
		var classId = obj.value;
		resetGcId3();
		
		if(classId == -1){
		  return;
		}

		$.ajax({
            async:false,
            url:"${base}/goods/goodsCommon/findClassByParentId",
            data:{id:classId},
            error:function(){frameControl.lhDgFalInfo("通讯失败!");},
            dataType:'html',
            type: "POST",
			contentType:"application/x-www-form-urlencoded; charset=utf-8", 
            success: function(data){
            var jsonObj = eval("(" + data + ")");
            var classArray = eval("(" + jsonObj.result + ")");

			for ( var i = 0; i < classArray.length; i++) {
				var $option = $("<option></option>");
				$option.attr("value", classArray[i].gcId);
				$option.text(classArray[i].gcName);
				$("#gcId3").append($option);
			}
				
			}
        });
	}
	
	/*清空二级分类下面的option选项*/
	function resetGcId2(){
		$("#gcId2").html("");
        var $option = $("<option></option>");
		$option.attr("value", -1);
		$option.text("请选择……");
		$("#gcId2").append($option);
	}
	
	/*清空三级分类下面的option选项*/
	function resetGcId3(){
		$("#gcId3").html("");
        var $option = $("<option></option>");
		$option.attr("value", -1);
		$option.text("请选择……");
		$("#gcId3").append($option);
	}
	
	function cleanClassCur(){
		for(var i=0;i<=3;i++){
			$("#li" + i).removeClass("cur");
		}
	}
	
	/**所有商品***/
	function queryGoods(type){
		var parma = "";
		$("#control-mod").show();
		
		cleanClassCur();
		$("#li"+type).addClass("cur");
		
		if(type == 0){
			parma = "";
		}else if(type == 1){
			parma = "goodsState=10";
		}else if(type == 2){
			parma = "goodsVerify=10";
		}

		var div = $("#div").val();
		
		$.ajax({
            async:false,
            url:"${base}/goods/goodsCommon/list",//默认加载list 页面
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
	
	/**商品设置***/
	function setGoods(){
		var parma = "";
		cleanClassCur();
		$("#li3").addClass("cur");
		
		$("#control-mod").hide();
		var div = $("#div").val();
		
		$.ajax({
            async:false,
            url:"${base}/goods/goodsCommon/setGoods",//默认加载list 页面
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

	
	</script>
  
