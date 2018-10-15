<link rel="shortcut icon" href="${base}/res/css/favicon.ico"/>
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_store.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/font-icons/style.css"  rel="stylesheet" />

<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>

<style>
	body {
		min-width:500px;
	}
	.layout {
		font-size: 1.2em;
	  	line-height: 20px;
	  	margin: 10px auto;
	  	width: 100%;
	}
	.layout .right-content {
		width: 100%;
		float: left;
	}
	.wrap {
		background-color: #fff;
		width: 97%;
		clear: both;
		margin: 0;
		border: 1px solid #C4D5E0;
		padding: 12px;
	}
	.search-form input.text {
		font-family: Tahoma;
	  	width: 150px;
	  	height: 20px;
	  	line-height: 20px;
	  	background-color: #FFF;
	  	padding: 3px!important;
	  	border: solid 1px;
	  	border-color: #BBB;
	}
</style>

<div class="right-content">
	<div class="main">
		<link rel="stylesheet" type="text/css"
			href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css">
		<div class="wrap">
			<div class="tabmenu">
				<ul class="tab pngFix">
					<li class="active"><a
						href="#?act=store&amp;op=store_coupon">优惠券列表</a></li>
				</ul>
				<a href="javascript:addCoupon();" class="ncu-btn3" title="新增优惠券"> 新增优惠券</a>
			</div>
			<form method="get" action="${base}/platform/coupon/list" target="_self" id="queryForm">
				<table class="search-form">
					<tbody>
						<tr>
							<td>&nbsp;</td>
							<th>优惠券名称：</th>
							<td class="w150">
								<input class="text" id="in" name="couponTitle" value="" type="text">
							</td>
							<th>有效期：</th>
							<td class="w180">
								<!-- <input class="text hasDatepicker" name="couponStartDate" id="couponStartDate" value="" readonly="readonly" type="text"> – 
								<input class="text hasDatepicker" name="couponEndDate" id="couponEndDate" value="" readonly="readonly" type="text"> -->
								<input class="text hasDatepicker" name="couponStartDate" 
									   onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'couponEndDate\')}',alwaysUseStartDate:true})"
									   id="couponStartDate" readonly="readonly" type="text" value="${coupon.startTimeStr}"> –  
								<input class="text hasDatepicker" name="couponEndDate" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'couponStartDate\')}',alwaysUseStartDate:true})"
									   id="couponEndDate" readonly="readonly" type="text" value="${coupon.endTimeStr}">
								
							</td>
							<td class="w90 tc">
								<input class="submit" value="搜索" type="submit">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<table class="ncu-table-style">
				<thead>
					<tr>
						<th class="w10"></th>
						<th class="w120">优惠券图片</th>
						<th class="tl">优惠券名称</th>
						<th class="w60">优惠金额</th>
						<th class="w180">使用期限</th>
						<th class="w60">上架</th>
						<th class="w80">审核状态</th>
						<th class="w90">操作</th>
					</tr>
				</thead>
				<tbody>
				<#if datas?size gt 0>
					<#list datas as coupon>
						<tr class="bd-line">
							<td></td>
							<td>
								<span href="qw" title="${coupon.couponTitle}"> 
									<img style="display: inline;" src="${imgServer}${coupon.couponPic}"
										height="60" width="98">
								</span>
							</td>
							<td class="tl">
								<a href="#" target="_blank">${coupon.couponTitle}</a>
							</td>
							<td class="goods-price">${coupon.couponPrice}</td>
							<td class="goods-time">
							<#if coupon.startTimeStr??>
								${coupon.startTimeStr?string("yyyy-MM-dd")}~${coupon.endTimeStr?string("yyyy-MM-dd")}</td>
							<#else>
																
							</#if>
							<td>
								<#if coupon.couponState == 1>
									下架
								<#else>
									上架
								</#if>
							</td>
							<td>
								<#if coupon.couponAllowState == 0>
									待审核
								<#elseif coupon.couponAllowState == 1>
									已通过
								<#elseif coupon.couponAllowState == 2>
									未通过
								</#if>
							</td>
							<td>
								<p>
									<a href="javascript:void(0)" onclick="editCoupon(${coupon.couponId})">修改优惠券</a>
								</p>
								<#if coupon.couponAllowState != 1>
								<p>
									<a href="javascript:void(0)" onclick="deleteCoupon(${coupon.couponId})" class="ncu-btn2 mt5">删&nbsp;除</a>
								</p>
								</#if>
							</td>
						</tr>
					</#list>
				<#else>
					<tr>
						<td colspan="8">暂无数据</td>
					</tr>
				</#if>
				</tbody>
				<tfoot>
					<tr>
				        <td colspan="20">
			                <#import "/commons/page.ftl" as q><!--引入分页-->
							<#if recordCount??>
							    <@q.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="${toUrl}"/>
							</#if>
				        </td>
			    	</tr>
				</tfoot>
			</table>
		</div>
		<script>
			function addCoupon() {
			   	layer.open({
				    type: 2,
				    area: ['500px', '550px'],
				    skin: 'layui-layer-rim',
				    title: '新增优惠券',
				    content :  ['${base}/platform/coupon/add', 'no'],
				    success: function(layero, index){
				    }
				});
			}
			
			function deleteCoupon(id) {
				layer.confirm('确定删除?', function(){
					$.ajax({
						type: "post",
						url: "${base}/platform/coupon/delete?id=" + id,
						dataType: "json",
						async:false,
						success:function(data) {
							if(data.success){
							 	parent.layer.alert(data.msg,{icon:1},function(){
									location.reload();
								});
							}else{
								parent.layer.alert(data.msg,{icon:2},function(){
									location.reload();
								});
							}
						}
					});
				});
			}
			
			function editCoupon(id) {
			   	layer.open({
				    type: 2,
				    area: ['500px', '550px'],
				    skin: 'layui-layer-rim',
				    title: '修改优惠券',
				    content :  ['${base}/platform/coupon/edit?id=' + id, 'no'],
				    success: function(layero, index){
				    }
				});
			}
			
		</script>
	</div>
</div>
<div class="clear"></div>
