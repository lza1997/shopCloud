<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>商品栏位管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/goodsGroup/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="adv_form" action="${base}/goodsGroup/saveOrUpdate" method="post">
    <table class="table tb-type2">
        <tbody>
        	<tr class="noborder">
	            <td colspan="2" class="required"><label class="validation" for="advTitle">商品栏位名称:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform">
					 <input type="text" value="" name="recommendName" id="recommendName" maxlength="100" class="txt">	
				</td>
	            <td class="vatop tips"></td>
	        </tr>
	        <tr class="noborder">
	            <td colspan="2" class="required"><label class="validation" for="advTitle">商品栏位描述:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform">
	              <textarea rows="8" cols="2" name="recommendInfo"></textarea>
	            </td>
	            <td class="vatop tips"></td>
	        </tr>
	      <tr>
	            <td colspan="2" class="required" ><label for="resUrl" class="validation">是否启用:</label></td>
	       </tr>
	        <tr class="noborder">
                <td class="vatop rowform onoff"><label for="recommendUse1" class="cb-enable selected"><span>启用</span></label>
                    <label for="recommendUse0" class="cb-disable"><span>停用</span></label>
                    <input id="recommendUse1" name="recommendUse"  value="1" type="radio" checked="checked">
                    <input id="recommendUse0" name="recommendUse" value="0" type="radio"></td>
                </td>
                <td class="vatop tips"></td>
	        </tr>
        </tbody>
        <tfoot>
	        <tr>
	            <td colspan="2"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
	        </tr>
        </tfoot>
    </table>
</form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){
        $("#submitBtn").click(function(){
            //if($("#adv_form").valid()){
                $("#adv_form").submit();
           // }
        });
        /*  $('#adv_position_form').validate({
           errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
            	mname: {
                    required : true,
                    maxlength: 10,
                    minlength: 1
                },
                murl: {
                    required : true,
                    maxlength: 30,
                    minlength: 1
                },
                msort: {
                    required : true,
                    digits	 : true
                }
            },
            messages : {
            	mname : {
                    required : '请填写菜单名称',
                    maxlength: '规格菜单名称长度应在1-10个字符之间',
                    minlength: '规格菜单名称长度应在1-10个字符之间'
                },
                murl : {
                    required : '请填写菜单路径',
                    maxlength: '规格菜单路径长度应在1-30个字符之间',
                    minlength: '规格菜单路径长度应在1-30个字符之间'
                },
                msort: {
                    required : '请填写菜单排序',
                    digits   : '请填写整数'
                }
            } 
        });*/
    });
    
  //上传图片
	function ajaxFileUploads(myfiles,resUrl){
	   $.ajaxFileUpload({
	        //处理文件上传操作的服务器端地址
	        url:"${base}/adv/uploadImage",
	        secureuri:false,                       //是否启用安全提交,默认为false
	        fileElementId:myfiles,           //文件选择框的id属性
	        dataType:'json',                       //服务器返回的格式,可以是json或xml等
	        success:function(data, status){//服务器响应成功时的处理函数
	            if(data.success == true ){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
	            	$("img[id='resUrl']").attr("src", "${imgServer}/"+data.result);
	            	$("#resUrl").val(data.result);
	            }
	        },
	        error:function(data, status, e){//服务器响应失败时的处理函数
	            //layer.alert('图片上传失败，请重试！！');
	        }
	    });
	}
  
	//删除
	function reMove(){
		$("img[id='resUrl']").attr("src", "${base}/res/images/nopic.png");
    	$("#resUrl").val("");
	}
	
	$(function(){
        $('#startTime').datepicker({dateFormat: 'yy-mm-dd'});
        $('#endTime').datepicker({dateFormat: 'yy-mm-dd'});
    });
</script>
</@layout.body>