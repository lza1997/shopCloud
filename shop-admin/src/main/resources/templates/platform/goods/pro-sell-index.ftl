<!-- css -->
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_store.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">

<!-- js -->
<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js"></script>
<script type="text/javascript" src="${base}/res/js/member/member.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/utils.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>


<div class="layout">
<div class="item-title">
<h3>发布平台商品</h3>
</div>
    <!--S 分类选择区域-->
    <div class="wrapper_search">
        <div class="wp_search_result" style="display:none;">
            <div class="back_to_sort"><a href="JavaScript:void(0);" nc_type="return_choose_sort">&lt;&lt;返回商品分类选择</a></div>
            <div class="no_result" id="searchNone" style="display:none;">
                <div class="cont">
                    <p>没有找到相关的商品分类。</p>
                    <p><a href="JavaScript:void(0);" nc_type="return_choose_sort">
                        <button>返回商品分类选择</button>
                    </a>
                    <p>
                </div>
            </div>
            <div class="has_result" id="searchLoad" style="display:none;">
                <div class="loading"><img src="http://192.168.1.220/templates/default/images/loading.gif" alt="loading..." ><span class="txt_searching">搜索中...</span></div>
            </div>
            <div class="has_result" id="searchSome" style="display:none;">
                <div id="searchEnd"></div>
                <div class="result_list" id="searchList">
                    <ul>
                    </ul>
                </div>
            </div>
        </div>
        <div class="wp_sort" style="position:relative;">
        <h3>选择分类</h3>
            <div id="class_div" class="wp_sort_block">
                <div class="sort_list">
                    <div class="wp_category_list">
                        <div id="class_div_1" class="category_list">
                            <ul>
                            	<#if datas??>
	                            	<#list datas as data>
		                                <li class="" onclick="selClass(this);" id="${data.gcId}|1">
			                                <a class="" href="javascript:void(0)">
			                                	<span class="has_leaf">${data.gcName}</span>
			                                </a>
		                                </li>
	                                </#list>
                                </#if>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="sort_list">
                    <div class="wp_category_list blank">
                        <div id="class_div_2" class="category_list">
                            <ul>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="sort_list">
                    <div class="wp_category_list blank">
                        <div id="class_div_3" class="category_list">
                            <ul>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="sort_list sort_list_last">
                    <div class="wp_category_list blank">
                        <div id="class_div_4" class="category_list ">
                            <ul>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tips_choice"  style="display: block; clear:both;"><span class="tips_zt"></span>
            <dl class="hover_tips_cont">
                <dt id="commodityspan"><span style="color:#F00;">请选择商品类别</span></dt>
                <dt id="commoditydt" style="display: none;" class="current_sort">您当前选择的商品类别是：</dt>
                <dd id="commoditydd"></dd>
               <!--  <dd id="commoditya" style="display: none;">&nbsp;&nbsp;<a href="JavaScript:void(0);">[添加到常用分类]</a></dd> -->
            </dl>
        </div>
        <div class="wp_confirm"> <span class="btn_confirm">
       		<#if goodsId!''>
                <form method="post" action="${base}/platform/editgoods">
					<input name="gcId" id="class_id" value="" type="hidden" />
					<input name="goodsId" id="goodsId" value="${goodsId}" type="hidden" />
					<input disabled="disabled" id="button_next_step" value="下一步" type="submit"  class="submit" />
				</form>
			<#else>
				<form method="post" action="${base}/platform/sellDetail">
			        <input name="gcId" id="class_id" value="" type="hidden" />
			        <input disabled="disabled" id="button_next_step" value="下一步" type="submit"  class="submit" />
			    </form>
			</#if>
    </span> </div>
    </div>
    <script type="text/javascript">
        SEARCHKEY = '请输入商品名称或分类属性名称';
    </script>
    <script type="text/javascript">
 // 分类选择
    function selClass(obj){
    	
    	$('.wp_category_list').css('background','');
    	
    	$("#commodityspan").hide();
    	$("#commoditydt").show();
    	$("#commoditydd").show();
    	$(obj).siblings('li').children('a').attr('class','');
    	$(obj).children('a').attr('class','classDivClick');
    	tonextClass(obj.id);
    }
    function tonextClass(id){
    	var valarray = id.split('|');
    	$('#class_id').val(valarray[0]);
    	/* $('#t_id').val(valarray[2]); */
    	$('#dataLoading').show();
    	$.getJSON('${base}/platform/findChildClass?id='+valarray[0],
    		function(data){
        		if(data.result != null && data.result != "null" && data.result != ""){
        			var jsonObj = eval("(" + data.result + ")");
        			$('#button_next_step').attr('disabled',true);
    				var a='';
    				var class_div_id = parseInt(valarray[1])+1;
    				for (i=0; i<jsonObj.length; i++) {
    					a+='<li onclick="selClass(this);" id="'+ jsonObj[i].gcId +'|'+class_div_id+'"><a href="javascript:void(0)"><span class="has_leaf">'+jsonObj[i].gcName+'</span></a></li>';
    				}
    				$('#class_div_'+class_div_id).parents('.wp_category_list').removeClass('blank');
    				for (j=class_div_id; j<=4; j++) {
    					$('#class_div_'+(j+1)).parents('.wp_category_list').addClass('blank');
    				}
    				$('#class_div_'+class_div_id).children('ul').empty();
    				$('#class_div_'+class_div_id).children('ul').append(a);
    				$('#class_div_'+class_div_id).nextAll('div').children('ul').empty();
    				var str="";
    				$.each($('a[class=classDivClick]'),function(i){
    					str+=$(this).html()+"&nbsp;&gt;&nbsp;";
    				});
    				str=str.substring(0,str.length-16);
    				$('#commoditydd').html(str);
    				$('#commoditya').hide();	//添加到常用分类
    				$('#dataLoading').hide();
        		}else {
        			for(var i= parseInt(valarray[1]); i<4; i++){
        				$('#class_div_'+(i+1)).children('ul').empty();
        			}
        			var str="";
        			$.each($('a[class=classDivClick]'),function(i){
        				str+=$(this).html()+"&nbsp;&gt;&nbsp;";
        			});
        			str=str.substring(0,str.length-16);
        			$('#commoditydd').html(str);
        			$('#commoditya').show();	//添加到常用分类
        			disabledButton();
        			$('#dataLoading').hide();
        		}
    		}
    	);
    }
    function disabledButton(){
    	if($('#class_id').val() != ''){
    		$('#button_next_step').attr('disabled',false).css('cursor','pointer');
    	}else {
    		$('#button_next_step').attr('disabled',true).css('cursor','auto');
    	}
    }

    // 搜索栏文字显示灰色
    $('#searchKey').css('color','rgb(153, 153, 153)');

    // 分类搜索js
    $('#searchKey').unbind().focus(function(){
    	if($(this).val() == SEARCHKEY){
    		$(this).val('');
    	}
    })
    .blur(function(){
    	if($(this).val() == ''){
    		$(this).val(SEARCHKEY);
    	}
    });

    // ajax查询分类TAG
    $('#searchBtn').unbind().click(function(){
    	$('#searchNone').hide();
    	$('#searchSome').hide();
    	if($('#searchKey').val() != SEARCHKEY && $('#searchKey').val() != ''){
    		$('.wp_search_result').show();
    		$('#searchLoad').show();
    		$('.wp_sort').hide();
    	    $.getJSON('index.php?act=store_goods&op=ajax_class_search&column=ok',{value:$('#searchKey').val()}, function(data){
                if (data == false){
                	$('#searchLoad').hide();
                	$('#searchNone').show();
                }else{
                    if (data.length > 0){
                    	var tag = '';
                        for (i = 0; i < data.length; i++){
                            tag +=('<li nc_type="searchList_name" id="'+data[i].gc_id+'|'+data[i].type_id+'">'+data[i].gc_tag_name+'</li>');
                        }
                        
                    }
                    $('#searchLoad').hide();
                    $('#searchSome').show();
                    $('#searchList > ul').html(tag);
                    $.getScript("./resource/js/jquery.goods_add_step1.js");
                }
    	    });
    	}else{
    		alert(SEARCHKEY);
    	}
    });

    // 返回分类选择
    $('a[nc_type="return_choose_sort"]').unbind().click(function(){
    	$('#class_id').val('');
    	$('#t_id').val('');
    	$("#commodityspan").show();
    	$("#commoditydt").hide();
    	$('#commoditydd').html('');
    	$('.wp_search_result').hide();
    	$('#commoditya').hide();
    	$('.wp_sort').show();
    });

    // 分类搜索后选择
    $('li[nc_type="searchList_name"]').unbind().click(function(){
    	valuearray = $(this).attr('id').split('|');
    	$('#class_id').val(valuearray[0]);
    	$('#t_id').val(valuearray[1]);
    	$("#commodityspan").hide();
    	$("#commoditydt").show();
    	$('#commoditydd').html($(this).html());
    	$('#commoditya').show();
    	disabledButton();
    });

    // 常用分类选择 展开与隐藏
    $('#commSelect').unbind().click(function(){	
    	if($('#commListArea').css('display') == 'none'){
    		$('#commListArea').show();
    	}else{
    		$('#commListArea').hide();
    	}
    });

    // ajax添加常用分类
    $('#commoditya > a').unbind().click(function(){
    	$.getJSON('${base}/platform/findChildClass?id='+$('#class_id').val(), function(data){
    		if (data.result != null && data.result != "null" && data.result != ""){
    			var jsonObj = eval("(" + data.result + ")");//+'|'+data.staple_id+'|'+data.type_id
                $('#commListArea > ul').prepend('<li nc_type="'+jsonObj.gcId+'"><span class="title">'+data.staple_name+'</span><a class="del_unavailable" href="JavaScript:void(0);"></a></li>');
                $('#select_list_no').hide();
                showTips(data.msg, 100, 1);
            }else{
            	alert(data.msg);
            }
    	});
    });

    // 常用分类选择
    $('#commListArea').find('span[class="title"]').die().live('click',function(){
    	$('#dataLoading').show();
    	$('.wp_category_list').addClass('blank')
    	$.getJSON('index.php?act=store_goods&op=ajax_show_comm&name='+$(this).parent().attr('nc_type'), function(data){
    		if (data.done){
    			$('.category_list').children('ul').empty();
    			if(data.one.length > 0){
    				$('#class_div_1').children('ul').append(data.one).parents('.wp_category_list').removeClass('blank');
    			}
    			if(data.two.length > 0){
    				$('#class_div_2').children('ul').append(data.two).parents('.wp_category_list').removeClass('blank');
    			}
    			if(data.three.length > 0){
    				$('#class_div_3').children('ul').append(data.three).parents('.wp_category_list').removeClass('blank');
    			}
    		}else{
    			$('.wp_category_list').css('background','#E7E7E7 none');
    			$('#commListArea').find('li').css({'background':'','color':''});
    			$(this).parent().css({'background':'#3399FD','color':'#FFF'});
    		}
    	});
    	$('#dataLoading').hide();
    	valarray = $(this).parent().attr('nc_type').split('|');
    	$('#class_id').val(valarray[0]);
    	$('#t_id').val(valarray[2]);
    	$("#commodityspan").hide();
    	$("#commoditydt").show();
    	$('#commoditydd').show().html($(this).text());
    	$('#commSelect').val($(this).text());
    	disabledButton();
    	$('#commListArea').hide();
    	$('#commoditya').hide();
    });

    // ajax删除常用分类
    $('#commListArea').find('a[class="del_unavailable"]').die().live('click',function(){
    	li = $(this).parent();
    	valarray = li.attr('nc_type').split('|');
    	$.getJSON('index.php?act=store_goods&op=ajax_staple_control&column=del&class_id='+valarray[1], function(data){
    		if (data.done){
    			li.remove();
    		}else{
    			alert(data.msg);
    		}
    	});
    });
    </script>
    
    </div>
