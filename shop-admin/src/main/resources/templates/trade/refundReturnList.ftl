<div class="cont-mod">
<!-- 分页查询表单 -->
<form action="${base}/refundReturn/list" class="" id="listDataFm" target="#dataListDiv">		
	<!-- 操作按钮 -->
	<!-- 数据列表 -->
	<table class="member-list" id="acct_grid" border="0">
        <thead>
            <tr>
                <th >订单编号</th>
                <th >退货编号</th>
                <th >店铺名</th>
                <th >商品名称</th>
                <th >买家会员名</th>
                <th >申请时间</th>
                <th >商家审核时间</th>
                <th >退款金额</th>
                <th >退货数量</th>
                <th >操作</th>
            </tr>
        </thead>
		<tbody id="grid">
            <!--循环列表数据-->
            <#if datas??>
			  <#list datas as str>
			  	<tr>
			  		<!--td><input type="checkbox" class="checkbox" value="${str.storeId}"/></td-->
			  		<td>${str.orderSn}</td>
			  		<td>${str.refundSn}</td>
			  		<td>${str.storeName}</td>
			  		<td>${str.goodsName}</td>
			  		<td>${str.buyerName}</td>
			  		<td>${str.createTimeStr}</td>
			  		<td>${str.sellerTimeStr}</td>
			  		<td>${str.refundAmount}</td>
			  		<td>${str.goodsNum}</td>
			  		<td class="icon-link">
			  			<a href="#" class="icon-del" title="编辑" >编辑</a>
			  			<!--a href="#" class="icon-edit" title="弹出demo" onclick="opertest('${str.id}')">弹出demo</a-->
			  			<a href="#" class="icon-detail" title="弹出demo" onclick="operdetail('${str.refundId}')">查看</a>
			  		</td>
			  	</tr>
			  </#list>
			</#if>
			 <!--结束-->
            </tbody>
            <!--tbody>
                <tr>
                    <th colspan="10" >
                        <label  class="all_select"><input  type="checkbox" class="checkbox" onclick="checkAll();"/>全选</label>
                        <a  href="#" class="btnb-s" onclick="deleteLog();">批量删除</a>
                    </th>
                </tr>
            </tbody-->
            
	</table>
</form>
<tfoot>
    <tr>
        <th colspan="7">
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
		var url = "${base}/refundReturn/delLog";
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
						initDataList();
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
		var url = "${base}/refundReturn/findById?id="+id;
		frameOperate.prepareUpdate('update','查看详情',url,450,350,false);
	}
</script>