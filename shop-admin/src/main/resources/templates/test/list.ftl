<div class="cont-mod">
<!-- 分页查询表单 -->
<form action="${base}/test/list" class="" id="listDataFm" target="#dataListDiv">		
	<!-- 操作按钮 -->
	<!-- 数据列表 -->
	<table class="member-list" id="acct_grid" border="0">
        <thead>
            <tr>
                <th width="4%"></th>
                <th width="19%">会员名 / 昵称</th>
                <th width="10%">等级</th>
                <th width="10%">手机号</th>
                <th width="15%">QQ / 邮箱</th>
                <th width="20%">最后登录 / 次数</th>
                <th width="10%">预存款</th>
                <th width="15%">操作</th>
            </tr>
        </thead>
		<tbody id="grid">
            <!--循环列表数据-->
            <#if datas??>
			  <#list datas as str>
			  	<tr>
			  		<td><input type="checkbox" class="checkbox" value="${str.id}"/></td>
			  		<td>${str.realName}</td>
			  		<td>
			  			<#if str.certifyClass??>
							<#if str.certifyClass=="0">无级别</#if> 
							<#if str.certifyClass=="1">普通牛仔</#if> 
							<#if str.certifyClass=="2">星级牛仔</#if> 
							<#if str.certifyClass=="3">钻石牛仔</#if> 
						</#if>
			  		</td>
			  		<td>${str.cellPhone}</td>
			  		<td><span class="qq"> ${str.qq}</span><span class="email">${str.email}</span></td>
			  		<td><span class="time"></span><span class="frequency">${str.loginTime}</span></td>
			  		<td><span class="qq">可用: ${str.amount} 元</span><span class="email">冻结: ${str.freezeAmount} 元</span></td>
			  		<td class="icon-link">
			  			<!--a href="${base}/account/getAcct?id=${str.id}" class="icon-edit" title="编辑">编辑</a-->&nbsp;&nbsp;
			  			<a href="#" class="icon-del" title="删除" onclick="deleteDemo('${str.id}')">删除</a>
			  			<a href="#" class="icon-edit" title="弹出demo" onclick="opertest('${str.id}')">弹出demo</a>
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
                        <a href="#" class="btnb-s" onclick="deleteDemo();">批量删除</a>
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
	function deleteDemo(bizIdIn){
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
		var url = "${base}/test/delDemo";
		var para = {"ids":bizId};
		
		frameControl.lhDgCfmInfo(
			"确定要删除所选的"+dataNum+"条数据",
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
						initDataList();
					}else{
						frameControl.lhDgFalInfo(data.result+"!",frameElement.api);
					}
				}
	         });
			},
			function(){});
			
	}
	
</script>