<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>发货设置</h3>
            <ul class="tab-base">
                <li><a href="${base}/platformOrder/shipmentSetting" ><span>地址库</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>默认物流公司</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    </div>
    <input value="${storeExtend.storeId}" name="storeId" type="hidden"/>
  			<form method="POST" id='express_form' action="" >
    			<input value="ok" name="form_submit" type="hidden">
    			<table class="ncu-table-style" >
      				<thead>
        				<tr>
          					<th class="w20"></th>
          					<th colspan="4" class="tm">物流公司</th>
        				</tr>
      				</thead>
						<tbody>
						    <#assign x=0/>
							<#list list as oi>
							  <#assign x=x+1/>
							   <#if x=1>
								<tr class="bd-line">
									<td></td>
							   </#if>
									<td class="tl">
										<label> 
											<input type="checkbox" name="cexpress[]" value="${oi.id}"<#if expressIds??><#if expressIds?seq_contains(oi.id+'')>checked</#if></#if> />
											${oi.seName}
										</label>
									</td>
							   <#if x%4=0>
								</tr>
								<tr class="bd-line">
									<td></td>
							   </#if>
							</#list>
						</tbody>
						<tfoot>
					        <tr>
					          <td colspan="5"><a class="btn" href="javascript:void(0)"  onclick="saveStoreExtend()"><div align="center"><span>保存</span></div></a></td>
					        </tr>
      					</tfoot>
    				</table>
  				</form>
 <script type="text/javascript">
	function saveStoreExtend(){
		var storeId = $("input[name='storeId']").val();
		var data ="";
		if(storeId != ''){
			data = "storeId="+storeId+"&"+$(express_form).serialize();
		}else{
			data = $(express_form).serialize();
		}
		$.ajax({
           url:'${base}/platformOrder/saveStoreExtend',
           type:'post',
           data : data,
           dataType:'json',
           success:function(data){
				if(data.success){
                	layer.msg('保存成功', {icon: 1,time:1000},function(){location.reload();});
                }else{
                    layer.msg('保存失败', {icon: 2});
                }
           },error:function(data){
                layer.msg('通信失败', {icon: 2});
           }
        });
	}
</script>
 </@layout.body>