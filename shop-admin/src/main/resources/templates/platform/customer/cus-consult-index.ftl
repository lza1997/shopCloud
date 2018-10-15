<link rel="shortcut icon" href="${base}/res/css/favicon.ico"/>
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_store.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/font-icons/style.css"  rel="stylesheet" />

<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js"></script>
<script type="text/javascript" src="${base}/res/js/member/member.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/utils.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<style>
	body {
	  font: 12px/20px Arial,Verdana,"宋体","Lucida Grande","Lucida Sans Unicode",Helvetica,sans-serif;
	  color: #666;
	  min-width: 200px;
	  background: none;
	}
</style>
<body>
<div class="layout" style="margin-left: 10px;">
   <form method="post" action="" name="formSearch" id="formSearch">
   		<input type="hidden" name="pageNo" value="${pager.pageNo}">
   </form>
   <form method="post" action="" name="queryForm" id="queryForm">
   <input id="consultReply" type="hidden" value="${consultReply}" name="consultReply" >
   <input id="cur" type="hidden" value="${cur}" name="cur" >
   <input id="apm" type="hidden" value="${apm}" name="apm" >
   </form>
   <div class="main">
		<div class="wrap" style="width:100%">
		  <div class="tabmenu">
		  <ul class="tab pngFix">
			<li <#if (cur='index')>class="active"<#else>class="normal"</#if>><a href="${base}/consult/index?cur=index">全部咨询</a></li>
			<li <#if (cur='noreply')>class="active"<#else>class="normal"</#if>><a href="${base}/consult/index?consultReply=0&cur=noreply">未回复咨询</a></li>
			<li <#if (cur='reply')>class="active"<#else>class="normal"</#if>><a href="${base}/consult/index?consultReply=1&cur=reply">已回复咨询</a></li>
		  </ul>
		  </div>
		  <table class="ncu-table-style order">
		    <thead>
		      <tr>
		        <th class="w30"></th>
		        <th>咨询/回复</th>
		        <th class="w30"></th>
		        <th class="w90">操作</th>
		      </tr>
		      <tr>
		        <td class="tc"><input id="all" type="checkbox" class="checkall" /></td>
		        <td colspan="20"><label for="all">全选</label>
		          <a href="javascript:void(0);" onclick="deleteConsults()" class="ncu-btn1" nc_type="batchbutton" uri="" name="id" confirm="您确定要删除吗?"><span>删除</span></a></td>
		      </tr>
		    </thead>
		    <tbody>
		    <#if datas?? >
		    	<#list datas as data>
			      <tr>
			        <td colspan="19" class="sep-row"></td>
			      </tr>
			      <tr>
			        <th colspan="20" class="tl"><input name="ids" type="checkbox"  value="${data.consultId}" class="checkitem ml10 mr10" />
			          <span><a href="${base}/product/detail?id=${data.goodsIs}" target="_blank">${data.cgoodsName }</a></span><span class="ml20">咨询用户：</span>
			          ${data.cmemberName}<span class="ml20">咨询时间：<em class="goods-time">${data.createTimeStr?string('yyyy-MM-dd HH:mm:ss')}</em></span></th>
			      </tr>
			      <tr>
			        <td class="bdl w30"></td>
			        <td class="tl"><strong>咨询内容：</strong><span class="gray">${data.consultContent}</span></td>
			        <td></td>
			        <td rowspan="2" class="bdl bdr"><p><a href="javascript:void(0);" class="edit" nc_type="dialog" dialog_id="my_qa_edit_reply" dialog_title="回复咨询" dialog_width="480" onclick="updateConsult('${data.consultId}')">回复</a></p>
			                    <p> <a href="javascript:void(0)" onclick="delConsult('${data.consultId}');" class="ncu-btn2 mt5">删除</a> </p></td>
			      </tr>
			      <tr>
			        <td class="bdl"></td>
			        <td class="tl"><strong>我的回复：</strong><span class="gray">${data.consultReply}</span><#if data.consultReply??><span class="ml10 goods-time">${data.consultReplyTimeStr?string('yyyy-MM-dd HH:mm:ss')}</span></#if></td>
			        <td></td>
			      </tr>
		       </#list >
		     <#else >
			     <tbody>
			           <tr>
			              <td colspan="20" class="norecord"><i>&nbsp;</i><span>暂无符合条件的数据记录</span></td>
			           </tr>
			      </tbody>
		      </#if>
		    </tbody>
		    <tfoot>
		      <tr>
		        <td colspan="20">
		           <@layout.pager pager/>
		        </td>
		   	  </tr>
		   	   <!-- <tr>
		        <td class="tc"><input id="all" type="checkbox" class="checkall" /></td>
		        <td colspan="20"><label for="all2">全选</label>
		          <a href="javascript:void(0);" class="ncu-btn1" nc_type="batchbutton" uri="#?act=store_consult&op=drop_consult" name="id" confirm="您确定要删除吗?"><span>删除</span></a>
		          <div class="pagination"><ul><li><span>首页</span></li><li><span>上一页</span></li><li><span class="currentpage">1</span></li><li><span>下一页</span></li><li><span>末页</span></li></ul></div></td>
		      </tr> -->
		    </tfoot>
		  </table>
		</div>
	</div>
</div>
    <div class="clear"></div>
</div>
 <script type="text/javascript">
	
	function delConsult(id){
        var url = "${base}/consult/delete?replyId="+id;
        layer.confirm('确定删除?', function(){
            $.ajax({
                type: "post",
                url: url,
                data: null,
                dataType: "json",
                async:false,
                success:function(data) {
                    if(data.success == true){
                        layer.msg('删除成功', {icon: 1},initDataList());
                    }else{
                        layer.msg('删除失败', {icon: 2});
                    }
                }
            });
        });
    }
    
    function deleteConsults(){
    	var idsObj = $("input[name='ids']:checked");
    	var ids = "";
    	idsObj.each(function(){
    		ids += $(this).val() + ",";
    	});
    	if(ids==""){
    		layer.msg("请选择需要操作的数据",{icon:2,time:1000},function(){
    			layer.closeAll();
    			return;
    		});
    	}
    	$.ajax({
             type: "post",
             url: '${base}/consult/deleteConsults',
             data: {replyIds:ids},
             dataType: "json",
             async:false,
             success:function(data) {
                 if(data.success == true){
                     layer.msg('删除成功', {icon: 1},initDataList());
                 }else{
                     layer.msg('删除失败', {icon: 2});
                 }
             }
         });
    }
	
 	function updateConsult(id) {
        layer.open({
            type: 2,
            move: false,
            shade: false,
            title: '回复',
            content: ['${base}/consult/findById?replyId='+id, 'no'],
            area: ['450px', '200px'],
            btns: 2,
            btn: ['确定', '取消'],
            yes: function (index) {
           	var consultId = layer.getChildFrame('#consultId').val(); //具体地址
           	if(consultId==''){
           		layer.msg('提交失败', {icon: 2});
                   return false;
           	}
           	var content = layer.getChildFrame('#content').val(); //具体地址
               if(content==''){
                   layer.msg('回复内容不能为空', {icon: 2});
                   return false;
               }
                $.ajax({
                    url: '${base}/consult/edit',
                    type: 'post',
                    data: {consultReply:content, consultId:consultId},
                    dataType: 'json',
                    success: function (data) {
                        if (data.success == true ) {
                            layer.msg('修改成功', {icon: 1}, initDataList());
                        } else {
                            layer.msg('修改失败', {icon: 2});
                        }
                    }, error: function (data) {
                        layer.msg('通信失败', {icon: 2});
                    }
                });
                layer.close(index); //一般设定yes回调，必须进行手工关闭
            }, cancel: function (index) {
                layer.close(index);
            }
        });
     }
	 
	 function initDataList(){
		 location.reload();
	 }
</script>
</body>
</html>
