<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
    function delType(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
    function delRow(attpid){
        if(confirm('您确定要删除吗?')) {
        	$.ajax({
				type : "post",
				url : "${base}/attachPicture/deleteid",
				data : {"id":attpid},
				dataType : "json",
				async : false,
				success : function(data) {
					if (data.success="success") {
						location.reload();
					} else {
						layer.msg('图片删除失败，请重试！！', 1, 8);
					}
				}
			});
        }
    }
    //上传图片
	function ajaxFileUploads(myBlogImage,imgId,img){
	    $.ajaxFileUpload({
	        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	        url:'${base}/attachPicture/fileUpload',
	        secureuri:false,                       //是否启用安全提交,默认为false
	        fileElementId:myBlogImage,           //文件选择框的id属性
	        dataType:'json',                       //服务器返回的格式,可以是json或xml等
	        fileSize:5120000,
	        allowType:'jpg,jpeg,png,JPG,JPEG,PNG',
	        success:function(data, status){        //服务器响应成功时的处理函数
	            if( true == data.success){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
	            	location.reload();
	               /* $("img[id='"+imgId+"']").attr("src", "${imgServer}"+data.result);
	               $("#"+img).val(data.result); */
	            }
	        },
	        error:function(data, status, e){ //服务器响应失败时的处理函数
	        	layer.msg('图片上传失败，请重试！！', 1, 8);
	            //$('#result').html('图片上传失败，请重试！！');
	        }
	    });
	}
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>图片列表</h3>
            <ul class="tab-base">
                <li><a class="current" href="JavaScript:void(0);"><span>列表</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/attachPicture/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
    </form>
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd">
            <th colspan="12" class="nobg"> <div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span> </div>
            </th>
        </tr>
        <tr class="odd">
            <td><ul>
                <li>相册删除后，相册内全部图片都会删除，不能恢复，请谨慎操作</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <div align="right">
    	<table>
	    	<tr>
	        	<th>
	               	<a href="javascript:void(0);" class="btn-upload btng-s">
                       <input type="file" class="file" multiple="multiple" name="myfiles" id="myBlogImage0" onChange="ajaxFileUploads('myBlogImage0','busLicense','busLicense0');" />
                    </a>
	            </th>
	        </tr>
    	</table>
    </div>
    <form id="form_list" method="post" action="${base}/attachPicture/delete">
        <table class="table tb-type2">
            <tbody>
            <tr>
            	<td colspan="20">
            		<ul class="thumblists">
            			<#list pager.result as attachPicture>
            			<li class="picture">
            				<div class="size-64x64">
              					<span class="thumb">
                					<i></i>
									<img width="64" height="64" class="show_image" src="${imgServer}${attachPicture.localPath}">
				                	<span class="type-file-preview" style="display: none;">
	                  					<img src="${imgServer}${attachPicture.localPath}">
	        							<dl><dd>${attachPicture.createDate}</dd>
                					</span>
             					 </span>
            				</div>
            				<p>
              					<span><input class="checkitem" type="checkbox" name="ids" value="${attachPicture.id}"></span><span><a href="javascript:void(0);" onclick="delRow(${attachPicture.id})">删除</a></span>
            				</p>
            			</li>
            			</#list>
					</ul>
				</td>
			</tr>
            </tbody>
            <tfoot>
            <tr>
                <td><input type="checkbox" class="checkall" id="checkallBottom" /></td>
                <td id="dataFuncs" colspan="16"><label for="checkallBottom">全选</label>&nbsp;&nbsp;
                    <a class="btn" onclick="delType();" href="JavaScript:void(0);"> <span>删除</span> </a>
                    <@layout.pager pager/>
                </td>
            <tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>