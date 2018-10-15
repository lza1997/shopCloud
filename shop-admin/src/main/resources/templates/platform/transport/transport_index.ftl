<@layout.head>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"  />
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
<link href="${base}/res/css/member_store.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base }/res/css/transport.css" rel="stylesheet" type="text/css">
<script src="${base}/res/js/layer/layer.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>运费模板</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>所有模板</span></a></li>
                <li><a href="${base}/platform/transport/toAdd" ><span>新增模板</span></a></li>
            </ul>
        </div>
    </div>
    <div id="postage-tpl" style="padding: 20px 0;margin-top: 25px;">
		<#if transportList?size gt 0>
			<#list transportList as tl>
				<div id="J_TemplateList" class="manage-list">
					<div class="section J_Section">
						<div class="tbl-prefix">
							<span class="meta"> 最后编辑时间：<span class="J_LastModified">${tl.updatedTime}</span> 
							<#if tl.isDefault != '1'>
								<a href="javascript:void(0)" data-id="${tl.id}" onClick="setDefTran('${tl.id}')">设为默认的运费模板</a> | 
							</#if>
							<!-- <a class="J_Clone" href="javascript:void(0)" data-id="15">复制模板</a> |  -->
							<a href="${base}/platform/transport/toEdit?id=${tl.id}">修改</a> | 
							<a class="J_Delete" href="javascript:void(0)" data-id="${tl.id}">删除</a></span>
							<h3 class="J_Title">
								${tl.title}
								<#if tl.isDefault=='1'>
									<font style="color: red;">(默认的运费模板)</font>
								</#if>
							</h3>
							</div>
							<div class="tbl-head">
								<table cellspacing="0" cellpadding="0" border="0">
									<colgroup>
										<col class="col-express">
										<col class="col-area">
										<col class="col-starting">
										<col class="col-postage">
										<col class="col-plus">
										<col class="col-postageplus">
									</colgroup>
									<tbody>
										<tr>
											<th>运送方式</th>
											<th class="cell-area">运送到</th>
											<th>首件(个)</th>
											<th>运费(元)</th>
											<th>续件(个)</th>
											<th>运费(元)</th>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="entity">
								<table cellspacing="0" cellpadding="0" border="0">
									<colgroup>
										<col class="col-express">
										<col class="col-area">
										<col class="col-starting">
										<col class="col-postage">
										<col class="col-plus">
										<col class="col-postageplus">
									</colgroup>
									<tbody>
										<#if tl.transportExtendList??>
											<#list tl.transportExtendList as tel>
												<tr>
													<td>
														<#if tel.type=='py'>
															平邮
														</#if>
														<#if tel.type=='kd'>
															快递
														</#if>
														<#if tel.type=='es'>
															EMS
														</#if>
													</td>
													<td class="cell-area">${tel.areaName}</td>
													<td>${tel.snum}</td>
													<td>${tel.sprice}</td>
													<td>${tel.xnum}</td>
													<td>${tel.xprice}</td>
												</tr>
											</#list>
										</#if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</#list>
			</#if>
		</div>
		<script>
		$(function(){	
			$('a[class="J_Delete"]').click(function(){
				var id = $(this).attr('data-id');
				if(typeof(id) == 'undefined') return false;
				if (confirm('确认删除此模板?')){
					var url = '${base}/platform/transport/delete';
					var args = {"transportId":id};
					$.post(url, args, function(data){
						if("success" == data){
							layer.msg("删除成功" , {icon:1});
							setTimeout("ok()",1000); 
						}else{
							layer.msg("删除失败" , {icon:2});
						}
					});
				}
			});
			
			$('a[class="J_Clone"]').click(function(){
				var id = $(this).attr('data-id');
				if(typeof(id) == 'undefined') return false;
				$(this).attr('href','#?act=transport&op=clone&type=&id='+id);
				return true;
			});
			$('a[class="ncu-btn2"]').click(function(){
				var data = $(this).attr('enty-data');
				if(typeof(data) == 'undefined') return false;
				data = data.split('|||');
		//		opener.document.getElementById("postageName").innerHTML=data[0];
				$("#postageName", opener.document).css('display','inline').html(data[0]);
				$("#transport_id", opener.document).val(data[1]);
				window.close();
			});	
			
		});
		
		
		//设置默认运费模板
		function setDefTran(tranId){
			var url = "${base}/platform/transport/setDefaultTransport"
			var args = {"transportId":tranId};
			$.post(url, args, function(data){
				if(data == "success"){
					layer.msg("修改成功" , {icon:1});
					setTimeout("ok()",1000); 
				}else{
					layer.msg("修改失败" , {icon:2});
				}
			});
		}
		
		function ok(){
			window.location.href = '${base}/platform/transport/index';
		}
		</script>
</div>
</@layout.body>