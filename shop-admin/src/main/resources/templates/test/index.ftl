<@p.header title="demo">
<script type="text/javascript" src="${base}/res/js/grid.js"></script>
<script type="text/javascript" src="${base}/res/js/commons.js"></script>

</@p.header>

<body>
	<div class="iframebox">
		<h3 class="cont-tit">demo列表管理</h3>
        <div class="control-mod">
            <a href="${base}/account/getAcct" class="btna btn-addto"><b>+</b>新增会员</a>
            <form id="acct-form" method="post" action="" name="queryListForm">
                <input type="hidden" name="pageNo" id="pageNum" value="${pageNo}"/>
            	<input type="hidden" name="div" id="div" value = "#dataListDiv"/>
                <input type="text" name="acctName" class="text" placeholder="输入会员名或邮箱进行搜索" value="${acctName}"/>
                <span class="col">等级：
                    <select name="certifyClass" class="select" >
                        <option value="0" <#if certifyClass==0>selected</#if>>全部</option>
                        <option value="1" <#if certifyClass==1>selected</#if>>普通牛仔</option>
                        <option value="2" <#if certifyClass==2>selected</#if>>星级牛仔</option>
                        <option value="3" <#if certifyClass==1>selected</#if>>钻石牛仔</option>
                    </select>
                </span>
                <button type="button" class="btng" onclick="sbQuery();">搜索</button>
                <button type="button" class="btng" onclick="resetFm();">重置</button>
            </form>
        </div>
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
            url:"${base}/test/list",//默认加载list 页面
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
            url:"${base}/test/list",//默认加载list 页面
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
	
	
	/*弹出框demo*/
	function opertest(id){
		var url = "${base}/test/findById?id="+id;
		frameOperate.prepareUpdate('update','弹出框demo',url,840,400,false);
	}
	
	
	</script>
  
