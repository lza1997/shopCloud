<@layout.head>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
<link rel="stylesheet" href="${base}/res/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"  />
<script type="text/javascript" src="${base}/res/js/area_array.js"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" charset="utf-8" src="${base}/res/js/area.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>敏感词库上传</h3>
            <ul class="tab-base">
                <li><a class="current"><span>敏感词库上传</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="area_form" method="post" action="">
    	<div style="margin-top: 10px;">
    		<dl class="setup store-logo">
		        <dd>
		          <p>
		             <input  type="file" name="files"  hidefocus="true" id="storeLogofile" nc_type="change_store_Logo" onChange="ajaxFileUploads('storeLogofile');"/>
		          </p>
		          <p class="hint">此处上传您的敏感词文件；<br/><span style="color:orange;">文件格式仅为.txt；点击下方"提交"按钮后生效。</span></p>
		        </dd>
    		</dl>
	    	<table class="table tb-type2">
		        <thead>
		        <tr class="thead">
		            <th>文件名称</th>
		            <th>上传时间</th>
		            <th class="align-left">操作</th>
		           
		        </tr>
		        </thead>
		        <tbody>
			        <#list sensitiveList as sensitive>
			            <tr>
			                <td>${sensitive.fileName}</td>
			                <td>
			                    ${sensitive.upTime}
			                </td>
			                <td >
			                    <a href="${sensitive.filePath}" target="_blank">查看</a>
			                </td>
			            </tr>
			        </#list>
		        </tbody>
		        <tfoot>
			        <tr class="tfoot">
			            <td colspan="15"></td>
			        </tr>
		        </tfoot>
	    	</table>
    	</div>
    	
    </form>
</div>
<script type="text/javascript">
//上传敏感词库文件
function ajaxFileUploads(mySensitiveFlie){
    $.ajaxFileUpload({
        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
        url: '${base}/setting/sensitive/fileUpload',
        secureuri:false,                      //是否启用安全提交,默认为false
        fileElementId:mySensitiveFlie,           //文件选择框的id属性
        dataType:'json',                       //服务器返回的格式,可以是json或xml等
        fileSize:5120000,
        allowType:'txt,TXT',
        success:function(data, status){        //服务器响应成功时的处理函数
            if(data.success){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
            	//layer.msg('敏感词文件上传成功！！', {icon:1});
            	window.location = '${base}/setting/sensitive/add';
            }
        },
        error:function(data, status, e){ //服务器响应失败时的处理函数
        	 layer.msg('敏感词文件上传失败，请重试！！', {icon:2});
        }
    });
}

</script>
</@layout.body>