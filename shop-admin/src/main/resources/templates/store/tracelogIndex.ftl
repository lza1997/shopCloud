<@p.header title="demo">
<script type="text/javascript" src="${base}/res/jquery.dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${base}/res/js/grid.js"></script>
<script type="text/javascript" src="${base}/res/js/commons.js"></script>

<link href="${base}/res/js/lib/jquery.dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
</@p.header>

<body>
	<div class="iframebox">
		<h3 class="cont-tit">动态管理</h3>
		<ul class="cont-tab">
        <li id="gl" class="cur"><a href="javascript:void();" onclick="changeTable(0)">动态列表</a></li>
        <li id="sq"><a href="javascript:void();" onclick="changeTable(1)">评论列表</a></li>
    	</ul>
        <div class="control-mod" id="dt">
            <form id="acct-form" method="post" action="" name ="queryListForm">
            	<input type="hidden" id="div" value = "#dataListDiv"/>
            	<input type="hidden" id="pageNo" />
            	<input type="hidden" name="searchType" id="searchType" value="0"/>
            	店铺名称: <input type="text" name="storeName" class="text" placeholder="输入" value="${storeName}"/>
            	内容: <input type="text" name="content" class="text" placeholder="输入" value="${content}"/>
            	动态类型: 
            	<select name="type">
            	  <option value="">系统默认</option>
            	  <option value="1">relay</option>
            	  <option value="2">normal</option>
            	  <option value="3">new</option>
            	  <option value="4">coupon</option>
            	  <option value="5">xianshi</option>
            	  <option value="6">mansong</option>
            	  <option value="7">bundling</option>
            	  <option value="8">groupbuy</option>
            	  <option value="9">recommend</option>
            	  <option value="10">hotsell</option>
            	  </select>
                <span class="col">发表时间:
                    <input id="d5221" name="starttime" class="Wdate" style="width: 120px" type="text" onFocus="var d5222=$dp.$('d5222');WdatePicker({onpicked:function(){d5222.focus();},maxDate:'#F{$dp.$D(\'d5222\')}'})"/>
					~
					<input id="d5222" name="endtime" style="width: 120px" class="Wdate" type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d5221\')}'})"/>
                </span>
                <button type="button" class="btng" onclick="sbQuery();">搜索</button>
                <button type="button" class="btng" onclick="resetFm();">重置</button>
            </form>
        </div>
        
        <div class="control-mod" id="pl" style="display:none">
            <form id="plform" method="post" action="" name ="plistForm">
            	<input type="hidden" id="div" value = "#dataListDiv"/>
            	<input type="hidden" id="pageNo" />
            	<input type="hidden" name="searchType" id="searchType" value="1"/>
            	会员名: <input type="text" name="scommMembername" class="text" placeholder="输入" value="${scommMembername}"/>
            	内容: <input type="text" name="scommContent" class="text" placeholder="输入" value="${scommContent}"/>
            	状态: 
            	<select name="scommState">
            	  <option value="">请选择...</option>
            	  <option value="1">显示</option>
            	  <option value="0">屏蔽</option>
            	  </select>
                <span class="col">发表时间:
                    <input id="d5221" name="starttime" class="Wdate" style="width: 120px" type="text" onFocus="var d5222=$dp.$('d5222');WdatePicker({onpicked:function(){d5222.focus();},maxDate:'#F{$dp.$D(\'d5222\')}'})"/>
					~
					<input id="d5222" name="endtime" style="width: 120px" class="Wdate" type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d5221\')}'})"/>
                </span>
                <button type="button" class="btng" onclick="plQuery();">搜索</button>
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
            url:"${base}/tracelog/list",//默认加载list 页面
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
            url:"${base}/tracelog/list",//默认加载list 页面
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
	
	/**搜索评论***/
	function plQuery(){
		var div = $("#div").val();
		var parma = $("#plform").serialize();
		$.ajax({
            async:false,
            url:"${base}/tracelog/list",//默认加载list 页面
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
	function resetFm(){$("#acct-form")[0].reset();$("#plform")[0].reset();}
	function changeTable(type){
		if(type==0){
			$("#gl")[0].className="cur";
			$("#sq")[0].className="";
			$("#dt")[0].style.display="";
			$("#pl")[0].style.display="none";
			sbQuery();
		}else{
			$("#gl")[0].className="";
			$("#sq")[0].className="cur";
			$("#dt")[0].style.display="none";
			$("#pl")[0].style.display="";
			plQuery();
		}
		
	}
	
	
	
	
	</script>
  
