<div class="cont-mod">
<!-- 分页查询表单 -->
<form action="${base}/refundReturn/list" class="" id="listDataFm" target="#dataListDiv">		
	<!-- 操作按钮 -->
	<!-- 数据列表 -->
	<table class="member-list" id="acct_grid" border="0">
        <thead>
            <tr>
                <th >订单编号</th>
                <th >退款编号</th>
                <th >店铺名</th>
                <th >商品名称</th>
                <th >买家会员名</th>
                <th >申请时间</th>
                <th >商家审核时间</th>
                <th >退款金额</th>
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
			  		<td>${str.refundAmount/100}</td>
			  		<td class="icon-link">
			  			<a href="javascript:operdetail(${str.refundId})" class="icon-del" title="编辑" >编辑</a>
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
	/*查看详情*/
	function operdetail(id){
		var url = "${base}/refundReturn/findByIdMoney?id="+id;
		frameOperate.prepareUpdate('update','查看详情',url,650,600,false);
	}
</script>