<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.raty/jquery.raty.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.nyroModal/custom.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.poshytip.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<link href="${base}/res/js/jquery.nyroModal/styles/nyroModal.css" rel="stylesheet" type="text/css" id="cssfile2" />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>评价管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>来自买家的评价</span></a></li>
               <!--  <li><a href="${base}/trade/evalStore/list" ><span>店铺动态评价</span></a></li> -->
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" action="${base}/platform/trade/reviewIndex">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <input type="hidden" name="gevalStoreId" value="${geval.gevalStoreId}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="gevalGoodsName">商品名称</label></th>
                <td><input class="txt" type="text" name="gevalGoodsName" id="goods_name" value="${geval.gevalGoodsName}" /></td>
                <th><label for="gevalStorename">店铺名称</label></th>
                <td><input class="txt" type="text" name="gevalStorename" id="store_name" value="${geval.gevalStorename}" /></td>
                <td>评价时间</td>
                <td><input class="txt date" type="text" name="startTime" id="stime" value="${geval.startTime}" />
                    ~
                    <input class="txt date" type="text" name="endTime" id="etime" value="${geval.endTime}" /></td>
                <td><a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a></td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12">
	              <div class="title">
	                <h5>操作提示</h5>
	                <span class="arrow"></span>
	              </div>
	                 <a href="${imgServer}/upload/excelgoodeva.xls">下载评论模板</a>
	               	 导入评论信息:<input  type="file" name="files"  hidefocus="true" id="goodsexcel" nc_type="change_goodsexcel_file" onChange="ajaxFileUploads('goodsexcel');"/>
             </th>
        </tr>
        <tr>
            <td><ul>
                <li>买家可在订单完成后对订单商品进行评价操作</li>
                <li>评价信息将显示在对应的商品页面</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2">
        <thead>
        <tr class="thead">
            <th class="w300">商品名称  </th>
            <th>评价描述</th>
            <th class="w108 align-center">评价人 </th>
            <th class="w108 align-center">店铺名称</th>
            <th class="w72 align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as eval>
            <tr class="hover">
                <td><a href="${frontServer}/product/detail?id=${eval.gevalGoodsId}" target="_blank">${eval.gevalGoodsName}</a></td>
                <td class="evaluation"><div>商品评分：<span class="raty" data-score="${eval.gevalScore}"></span><time><#if eval.gevalAddTimeStr??>[${eval.gevalAddTimeStr}]</#if></time></div>
                    <div>评价内容：${eval.gevalContent}</div>
                    <#if eval.gevalImage !=null && eval.gevalImage != ''>
                        <div>晒单图片：
                            <ul class="evaluation-pic-list">
                                <#if eval.gevalImage?contains(",")>
                                    <#list eval.gevalImage?split(",") as img>
                                        <li><a nctype="nyroModal"  href="${imgServer}${img}"> <img src="${imgServer}${img}"> </a></li>
                                    </#list>
                                <#else>
                                    <li><a nctype="nyroModal"  href="${imgServer}${eval.gevalImage}"> <img src="${imgServer}${eval.gevalImage}"> </a></li>
                                </#if>
                            </ul>
                        </div>
                    </#if>
                    <#if eval.gevalExplain != null && eval.gevalExplain != ''>
                        <div id="explain_div_${eval.gevalId}"> <span style="color:#996600;padding:5px 0px;">[解释]${eval.gevalExplain}</span> </div>
                    </#if>
                    </td>
                <td class="align-center">${eval.gevalFrommembername}</td>
                <td class="align-center">${eval.gevalStorename}</td>
                <td class="align-center"><a nctype="btn_del" href="javascript:void(0)" data-geval-id="${eval.gevalId}">删除</a></td>
            </tr>
        </#list>
        <tfoot>
        <tr class="tfoot">
            <td colspan="15" id="dataFuncs">
            <@layout.pager pager/>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<form id="submit_form" action="${base}/platform/trade/delete" method="post">
    <input id="geval_id" name="id" type="hidden">
</form>

<script type="text/javascript">
    $(document).ready(function(){
        $('#stime').datepicker({dateFormat: 'yy-mm-dd'});
        $('#etime').datepicker({dateFormat: 'yy-mm-dd'});

        $('.raty').raty({
            path: APP_BASE+"/res/js/jquery.raty/img",
            readOnly: true,
            score: function() {
                return $(this).attr('data-score');
            }
        });

        $('a[nctype="nyroModal"]').nyroModal();

        $('[nctype="btn_del"]').on('click', function() {
            if(confirm("您确定要删除吗?")) {
                var geval_id = $(this).attr('data-geval-id');
                $('#geval_id').val(geval_id);
                $('#submit_form').submit();
            }
        });
    });
    
     //上传excel
	function ajaxFileUploads(myBlogImage){
	    $.ajaxFileUpload({
	        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	        url: '${base}/platform/trade/fileexcelUpload',
	        secureuri:true,                      //是否启用安全提交,默认为false
	        fileElementId:myBlogImage,           //文件选择框的id属性
	        dataType:'json',                       //服务器返回的格式,可以是json或xml等
	        fileSize:5120000,
	        allowType:'xls',
	        success:function(data,status){  //服务器响应成功时的处理函数
	            if(data.success){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
	            	    layer.msg(data.message,{icon:1});
                        setTimeout("" ,500);
	            }
	        },
	        error:function(data, status, e){ //服务器响应失败时的处理函数
	               alert(data.message);
	               //alert("生成失败");
	        	   layer.msg(data.message , {icon:2});
	        }
	    });
	}
</script>
</@layout.body>