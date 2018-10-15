<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script src="${base}/res/js/swfupload/swfupload.js" type="text/javascript"></script>
<script src="${base}/res/js/swfupload/swfupload.queue.js" type="text/javascript"></script>
<script src="${base}/res/js/swfupload/fileprogress.js" type="text/javascript"></script>
<script src="${base}/res/js/swfupload/handlers.js" type="text/javascript"></script>
<link href="${base}/res/js/swfupload/process.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
      
    });
    function deltplAll(){
        var items = $("input[name='names']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
  
    var swfu;
    window.onload=function() {
    	var uploadUrl = "o_swfupload";
    	//在firefox、chrome下，上传不能保留登录信息，所以必须加上jsessionid。
    	var jsessionid = $.cookie("JSESSIONID");
    	if(jsessionid) {
    		uploadUrl += ";jsessionid="+jsessionid;
    	}
    	swfu=new SWFUpload({
    		upload_url : uploadUrl,
    		flash_url : "${base}/res/js/swfupload/swfupload.swf",
    		file_size_limit : "100 MB",
    		post_params: {"root" : "${root}"},
    		file_types : "*.ftl",
    		file_types_description : "ftl Files",
    		file_queue_limit : 0,
    		custom_settings : {
    			progressTarget : "fsUploadProgress",
    			cancelButtonId : "btnCancel"
    		},
    		debug: false,
    		
    		button_image_url : "${base}/res/js/swfupload/button_notext.png",
    		button_placeholder_id : "spanButtonPlaceHolder",
    		button_text: "<span class='btnText'>文件上传</span>",
    		button_width: 81,
    		button_height: 24,
    		button_text_top_padding: 2,
    		button_text_left_padding: 20,
    		button_text_style: '.btnText{color:#666666; cursor:pointer;}',
    		
    		file_queued_handler : fileQueued,
    		file_queue_error_handler : fileQueueError,
    		file_dialog_complete_handler : fileDialogComplete,
    		upload_start_handler : uploadStart,
    		upload_progress_handler : uploadProgress,
    		upload_error_handler : uploadError,
    		upload_success_handler : uploadSuccess,
    		upload_complete_handler : uploadComplete,
    		queue_complete_handler : queueComplete2
    	});
    };
    function queueComplete2(numFilesUploaded) {
    	//刷新页面
    	location.href="v_list?root=${root}";
    }
  
</script>
<style>
.create-new {
    background: url(${base}/res/images/tpl/button.png) no-repeat -114px -111px;
    width: 59px;
    height: 24px;
    color: #666666;
    line-height: 24px;
    text-indent: 18px;
    border: 0 none;
    cursor: pointer;
}
.create-template {
    background: url(${base}/res/images/tpl/button.png) no-repeat -11px -43px;
    width: 81px;
    height: 24px;
    color: #666666;
    line-height: 24px;
    text-indent: 18px;
    border: 0 none;
    cursor: pointer;
    float: right;
    margin-top: -37px;
    margin-right: 80px;
}
.export {
    background: url(${base}/res/images/tpl/button.png) no-repeat -76px -347px;
    width: 59px;
    height: 24px;
    color: #666666;
    line-height: 24px;
    text-indent: 18px;
    border: 0 none;
    cursor: pointer;
</style>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>模板管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            
             </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
     <form  method="post" enctype="multipart/form-data" id="jvForm">
            <input type="hidden" name="root" value="${root}">
            <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="search_brand_name">当前目录: ${root }</label></th>
               <td width="70" align="center"><span id="spanButtonPlaceHolder"></span></td>
               <td><input class="cancel" id="btnCancel" type="hidden" value="取消" onclick="swfu.cancelQueue();" disabled="disabled" /></td>
             <td>
		&nbsp; 新建目录: <input type="text" name="dirName" size="10" onkeypress="if(event.keyCode==13){$('#dirButton').click();return false;}"/>
				<input class="create-new" id="dirButton" type="submit" value="新建" onclick="this.form.method='post';this.form.action='o_create_dir';"/>
			</td>
			<td> 
			
	
            </tr>
            </tbody>
        </table>
        </form>
      <form>
				<input type="hidden" name="root" value="${root }"/>
			 <input type="submit" value="创建模板" onclick="this.form.action='v_add';" class="create-template"/>
	</form>
    
    <form method="post" id='form_list' action="o_delete">
        <input type="hidden" name="form_submit" value="ok" />
        <input type="hidden" name="root" value="${root}"/>
        <table class="table tb-type2">
            <thead>			
            <tr class="thead">
                <th class="w24"></th>
                <th class="w24"></th>
                <th class="w470">文件名</th>
                <th class="w270">大小</th>
                <th class="w270">最后修改时间</th>
                <th class="w272">操作</th>
            </tr>
            </thead>
            <tbody>
        <#list list as tpl>

        <tbody>
        <tr>
        	<td><input value="${tpl.name}" class="checkitem" type="checkbox" name="names" id="${tpl.name}"></td>
        	<td><img src="${base}/res/images/tpl/${tpl.directory?string('folder','html')}.gif"/></td>
        	<td>
        	<#if tpl.directory>
		<a href="v_list?root=${tpl.name}">${tpl.filename}</a>
		<#else>
		${tpl.filename}
		</#if>
        	</td>
            <td>${tpl.size} KB</td>
            <td>${tpl.lastModifiedDate?string("yyyy-MM-dd HH:mm:ss")}</td>
            <td class="txt-link">
            
                <a <#if !tpl.directory>href="o_downFile?name=${tpl.name?url}" <#else>href="o_export?root=${root?url}&name=${tpl.name?url}" </#if> >下载</a> |
                 <a href="v_rename?root=${root?url}&name=${tpl.name?url}">重命名</a> |
                <a <#if !tpl.directory>href="v_edit?root=${root?url}&name=${tpl.name?url}" "<#else>disabled="disabled"</#if>>修改</a>｜
              
                <a href="o_delete_single?root=${root?url}&name=${tpl.name?url}" onclick="if(!confirm('确定要删除吗')) {return false;}" >删除</a>
                
                </td>
        </tr>
        </tbody>
    </#list>
            </tbody>
            <tfoot>
            <tr colspan="15" class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn"
                                   onclick="deltplAll()"><span>删除</span></a>
            </tr>
            </tfoot>
        </table>
    </form>
    <div class="clear"></div>
</div>
</@layout.body>