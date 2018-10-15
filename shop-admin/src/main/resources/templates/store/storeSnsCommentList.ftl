<div class="cont-mod">
<!-- 分页查询表单 -->
<form action="${base}/tracelog/list" class="" id="listDataFm" target="#dataListDiv">		
	<!-- 操作按钮 -->
	<!-- 数据列表 -->
	<table class="member-list" id="acct_grid" border="0">
        <thead>
            <tr>
                <th width="4%"></th>
                <th width="19%">内容</th>
                <th width="10%">会员名</th>
                <th width="10%">发表时间</th>
                <th width="15%">状态</th>
                <th width="15%">操作</th>
            </tr>
        </thead>
		<tbody id="grid"> 
            <!--循环列表数据-->
            <#if datas??>
			  <#list datas as str>
			  	<tr>
			  		<td><input type="checkbox" class="checkbox" value="${str.scommId}"/></td>
			  		<td>${str.scommContent}</td>
			  		<td>${str.scommMembername}</td>
			  		<td><span class="time">${str.scommTime}</span></td>
			  		<td><span class="ip"><#if str.scommState==0>屏蔽<#else>显示</#if></span></td>
			  		<td class="icon-link">
			  			<a href="#" class="icon-del" title="删除" onclick="deleteLog('${str.scommId}')">删除</a>
			  			<!--a href="#" class="icon-edit" title="弹出demo" onclick="opertest('${str.id}')">弹出demo</a-->
			  			<!--a href="#" class="icon-detail" title="弹出demo" onclick="operdetail('${str.straceId}')">查看</a-->
			  		</td>
			  	</tr>
			  </#list>
			</#if>
			 <!--结束-->
            </tbody>
            <tbody>
                <tr>
                    <th colspan="8">
                        <label class="all_select"><input type="checkbox" class="checkbox" onclick="checkAll();"/>全选</label>
                        <a href="#" class="btnb-s" onclick="deleteLog();">批量删除</a>
                        <a href="#" class="btnb-s" onclick="changeState(0);">屏蔽</a>
                        <a href="#" class="btnb-s" onclick="changeState(1);">显示</a>
                    </th>
                </tr>
            </tbody>
            
	</table>
</form>
<tfoot>
    <tr>
        <th colspan="8">
	  		<#import "/commons/page.ftl" as q><!--引入分页-->
	  		<#if recordCount??>
	  		<@q.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="${toUrl}"/>
	  		</#if>
        </th>
    </tr>
</tfoot>
</div>
<script type="text/javascript">
	/*初始化结果界面*/
	//$(function(){frameOperate.initQueryPage("#listDataTab");});

	/*继续当前分页 - 只要用于操作之后的更新*/
	function queryContinue(){frameAjax.loadFm("#listDataFm","${div}");}



	/**准备删除*/
	function deleteLog(bizIdIn){
		/*首先获取主键 - 然获取删除*/
		var bizId = null;
		if(bizIdIn){
			bizId = bizIdIn;
		}

		/*首先判断是否合乎条件 - 只有一条数据被选中*/
		if(!bizId){
			var updIds = frameOperate.getCheckedDatasByTabId("grid");
			if(!updIds){
				frameControl.lhDgOptInfo("请选择要删除的数据!");
				return;
			}
			bizId = updIds;
		}

		/*开始删除操作*/
		var dataNum = bizId.split(",").length;
		var url = "${base}/tracelog/delComment";
		var para = {"ids":bizId};
		
		frameControl.lhDgCfmInfo("确定要删除所选的"+dataNum+"条数据",
			function(){
				$.ajax({
	             type: "post",
	             url: url,
	             data: para,
	             dataType: "json",
				 async:false,
				 success:function(data) {
					if(data.success == "true"){
						frameControl.lhDgSucInfo("操作成功!",frameElement.api);
						plQuery();
					}else{
						frameControl.lhDgFalInfo(data.result+"!",frameElement.api);
					}
				}
	         });
			},
			function(){});
	}
	
	/**修改状态*/
	function changeState(state){ 
		/*首先获取主键 - 然获取删除*/
		var bizId = null;
		/*首先判断是否合乎条件 - 只有一条数据被选中*/
		if(!bizId){
			var updIds = frameOperate.getCheckedDatasByTabId("grid");
			if(!updIds){
				frameControl.lhDgOptInfo("请选择要修改的数据!");
				return;
			}
			bizId = updIds;
		}

		/*开始修改操作*/
		var dataNum = bizId.split(",").length;
		var url = "${base}/tracelog/updateCommentState";
		var para = {"ids":bizId,"state":state};
		
		frameControl.lhDgCfmInfo("确定要删除所选的"+dataNum+"条数据",
			function(){
				$.ajax({
	             type: "post",
	             url: url,
	             data: para,
	             dataType: "json",
				 async:false,
				 success:function(data) {
					if(data.success == "true"){
						frameControl.lhDgSucInfo("操作成功!",frameElement.api);
						plQuery();
					}else{
						frameControl.lhDgFalInfo(data.result+"!",frameElement.api);
					}
				}
	         });
			},
			function(){});
	}
	
	/*查看详情*/
	function operdetail(id){
		var url = "${base}/tracelog/findById?id="+id;
		frameOperate.prepareUpdate('update','查看详情',url,450,350,false);
	}
</script>