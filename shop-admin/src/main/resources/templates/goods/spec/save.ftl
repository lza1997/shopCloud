<@layout.head>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"/>
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>规格管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/goods/spec/list"><span>管理</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="spec_form" method="post" action="javascript:void(0);">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="s_name">规格：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="spName" id="s_name" /></td>
                <td class="vatop tips">请填写常用的商品规格的名称；例如：颜色；尺寸等。</td>
            </tr>
             <tr>
                <td class="required" colspan="2"><label class="validation" for="s_sort">排序：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="spSort" id="s_sort" value="0" /></td>
                <td class="vatop tips">请填写自然数。规格列表将会根据排序进行由小到大排列显示。</td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label class="validation" for="s_format">规格类型：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
	                <input type="radio" name="spFormat" checked="checked" specType="wenzi" value="0"/>文字
	                <input type="radio" name="spFormat" specType="tupian" />图片
				</td>
                <td class="vatop tips">图片类型的规格值用于直观表现某些特殊规格类型，例如颜色规格，可用对应的色彩图片来表现其各种颜色值。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="4"><label class="validation" for="s_value">添加规格值：</label></td>
            </tr>
            	<tr>
            		<td>
            			<span style="margin:10px " >排序</span>
            			<span style="margin:100px ">规格值</span>
            		</td>
            	</tr>
	            <tr class="noborder" name="specValueDiv">
	                <td class="vatop rowform" colspan="1.5">
	                	<input type="text" name="spValueSort" placeholder="排序"/>
	                	<input type="text" name="spValueName" placeholder="规格值"/>
	                	<p href="javascript:void(0);" style="display: none;" name="spValueImage">
	                		<input type="file" id="myBlogImage1" name="files" class="file" multiple="multiple" onChange="ajaxFileUploads('myBlogImage1',this);" />
							<img style='width:30px;height:30px' src='${base}/res/images/picture.gif'/>
							<input type="hidden"/>
						</p>
	                </td>
					<td class="vatop rowform">
	                	<a href="javascript:void(0);" onclick="deleteSpecValue(this)">移除</a>
					</td>
	            </tr>
            <tr>
                <td colspan="2">
                	<a class="btn-add marginleft" href="JavaScript:void(0);" id="addSpecValue">新增一个规格值</a>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);"> <span>提交</span> </a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
//全局变量,是图片还是文字
var specFormat='text';
//全局变量,文件上传的编号
var specImage = 2;

//上传规格图片
function ajaxFileUploads(imageid,ob) {
	var $obj = $(ob);
	var $img = $obj.next();
	var $hid = $obj.next().next();
    $.ajaxFileUpload({
        url: '${base}/upload/specImage',
        data: '',
        secureuri: false,
        fileElementId: imageid,
        dataType: 'json',
        success: function (data, status) {
            if (data.success) {
            	$img.attr("src",data.imageServer+"/"+data.result);
            	$hid.attr("value",data.result);
            } 
        },
        error: function (data, status, e) { //服务器响应失败时的处理函数
            if (type == 0) {
                $('#result_logo').html('图片上传失败，请重试！！');
            } else {
                $('#result_banner').html('图片上传失败，请重试！！');
            }
        }
    });
}

	//删除一个规格值
	function deleteSpecValue(obj){
		var len = $("[name=specValueDiv]").length
		if(len != 1){
			$(obj).parent().parent().remove();
		}
	}
    $(function(){
    	//新增一个规格值
    	$("#addSpecValue").click(function(){
    		var len = $("[name=specValueDiv]").length
    		var i = 0;
    		$("[name=specValueDiv]").each(function(){
    			if(i == (len-1)){
    				var myBlogImage = "myBlogImage" + specImage;
    				if(specFormat == 'image'){
    					$(this).after('<tr class="noborder" name="specValueDiv">'+
        		                '<td  class="vatop rowform" colspan="1.5">'+
        	                	'<input type="text" name="spValueSort" placeholder="排序"/> '+
        	                	'<input type="text" name="spValueName" placeholder="规格值"/>'+
        	                	'<p href="javascript:void(0);" name="spValueImage">'+
    		                		'<input type="file" id="'+myBlogImage+'" name="files" class="file" multiple="multiple" onChange="ajaxFileUploads(\''+myBlogImage+'\',this);" />'+
    								'<img style="width:30px;height:30px" src="${base}/res/images/picture.gif"/>'+
    								'<input type="hidden"/>'+
    							'</p>'+
        	                '</td>'+
        					'<td class="vatop rowform">'+
        	                	'<a href="javascript:void(0);" onclick="deleteSpecValue(this)">移除</a>'+
        					'</td>'+
        	            '</tr>');
    				}else{
    					 $(this).after('<tr class="noborder" name="specValueDiv">'+
        		                '<td class="vatop rowform" colspan="1.5">'+
        	                	'<input type="text" name="spValueSort" placeholder="排序"/> '+
        	                	'<input type="text" name="spValueName" placeholder="规格值"/>'+
        	                	'<p href="javascript:void(0);" style="display: none;" name="spValueImage">'+
    		                		'<input type="file" id="'+myBlogImage+'" name="files" class="file" multiple="multiple" onChange="ajaxFileUploads(\''+myBlogImage+'\',this);" />'+
    								'<img style="width:30px;height:30px" src="${base}/res/images/picture.gif"/>'+
    								'<input type="hidden"/>'+
    							'</p>'+
        	                '</td>'+
        					'<td class="vatop rowform">'+
        	                	'<a href="javascript:void(0);" onclick="deleteSpecValue(this)">移除</a>'+
        					'</td>'+
        	            '</tr>'); 
    				}
    				specImage++;
    			};
    			i++;
    		}); 
    	});
    		
    	
    	//文字,图片的js效果
    	$("[name=spFormat]").change(function(){
			if($(this).attr("specType") == "tupian"){
				specFormat='image';
				$(this).attr("value","1");
				$("[name=spValueImage]").each(function(){
					$(this).css("display","");
				});
			}else{
				specFormat='text';
				$(this).attr("value","0");
				$("[name=spValueImage]").each(function(){
					$(this).css("display","none");
				});
			}
    	});
    	
        //表单验证
        $('#spec_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                spName: {
                    required : true,
                    maxlength: 10,
                    minlength: 1
                },
                spSort: {
                    required : true,
                    digits	 : true
                },
                spValueSort: {
                    required : true,
                    digits	 : true,
                    maxlength: 3,
                    minlength: 1
                },
                spValueName: {
                    required : true,
                    maxlength: 10,
                    minlength: 1
                }
            },
            messages : {
                spName : {
                    required : '请填写规格名称',
                    maxlength: '规格名称长度应在1-10个字符之间',
                    minlength: '规格名称长度应在1-10个字符之间'
                },
                spSort: {
                    required : '请填写规格排序',
                    digits   : '请填写整数'
                },
                spValueSort: {
                    required : '请填写规格排序',
                    digits   : '请填写整数',
               	 	maxlength: '排序应在0-999之间数字',
                    minlength: '排序应在0-999之间数字'
                },
                spValueName: {
                    required : '请填写规格值',
                    digits   : '规格名称长度应在1-10个字符之间'
                }
            }
        });

        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#spec_form").valid()){
            	var spName = $("[name=spName]").val();
            	var spFormat = $("[name=spFormat]:checked").attr("value");
            	var spSort = $("[name=spSort]").val();
            	//获取规格值
            	var spValue = "";
            	$("[name=spValueName]").each(function(){
            		spValue += $(this).val() + ",";
            	});
            	spValue = spValue.substring(0,spValue.length-1);
            	//获取规格值对象的集合
            	var SpecValues = '[';
            	var tag = true;
            	$("[name=specValueDiv]").each(function(){
            		var spValueName = $(this).find("[name=spValueName]").val();
            		var spValueSort = $(this).find("[name=spValueSort]").val();
            		//判断是否有图片
            		if(spFormat == "1"){
            			var spValueImage = $(this).find(":hidden").val();
           				if(tag!=false && (spValueName==null||spValueName==""||spValueSort==null||spValueSort==""||isNaN(spValueSort))){
           					/* alert("规格值输入不合法"); */
           					tag = false;
           					layer.alert("规格值输入不合法",{icon:2});
           					return false
           				}
            			SpecValues += '{"spValueName":"' + spValueName + '","spValueImage":"' + spValueImage + '","spValueSort":"' + spValueSort + '"},'
            		}else{
            			SpecValues += '{"spValueName":"' + spValueName + '","spValueSort":"' + spValueSort + '"},'
            			if(spValueName == "" || spValueName == null ||spValueSort == "" || spValueSort == null||isNaN(spValueSort)){
            				tag = false;
           					layer.alert("规格值输入不合法",{icon:2});
           					return false
            			}
            		}
            	});
            	SpecValues = SpecValues.substring(0,SpecValues.length-1);
            	SpecValues += ']';
            	var args = {
            			"spName":spName,
            			"spFormat":spFormat,
            			"spSort":spSort,
            			"spValue":spValue,
            			"specValues":SpecValues
            	}
            	var url = "${base}/goods/spec/saveOrUpdate";
            	if(tag){
            		$.post(url,args,function(data){
                		$(".page").empty();
                		$(".page").append(data);
            	});
            	}
            	
            }
        });
    });

</script>
</@layout.body>