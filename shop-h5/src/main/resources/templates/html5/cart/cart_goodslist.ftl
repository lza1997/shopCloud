<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-touch-fullscreen" content="no" />
<meta name="format-detection" content="telephone=no,address=no" />
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<title>购物车列表页 </title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<script>
  function gift_tier_confirm(arg){
	  var size = jQuery("#gift_inner_"+arg).find(":checked").length;
	 	if(size==0){
			alert("请选择一件赠品！");
		}
		if(size>1){
			alert("只能选择一件赠品！");
		}
		if(size==1){
		 	var value = jQuery("#gift_inner_"+arg).find(":checked").val();
			var name = jQuery("#gift_inner_"+arg).find(":checked").attr("goods_name");
			var cart_id = jQuery("#gift_inner_"+arg).find(":checked").attr("cart_id");
			var img_url = jQuery("#gift_inner_"+arg).find(":checked").attr("img_url");
			jQuery("#gift_list_"+value).remove();
			jQuery("#li_"+arg).children().last().after("<div class='li_box' style='margin-top:5px;' id='gift_list_"+value+"' mark='"+arg+"' gogi='"+value+"'><div class='img' style='margin-left: 25px;'><a href=''><img src='"+img_url+"' width='60' height='60' /></a></div><div class='infro'><span class='name'><a href='javascript:void(0);'>"+name+" </a></span><span class='red'>赠品</span></div><div class='fr'></div></div>");
			jQuery("#gift_inner_"+arg).hide();
		}
	  }
  function gift_tier_show(arg){
		jQuery("#gift_inner_"+arg).show();	  
	  }
  function gift_tier_hide(arg){
		jQuery("#gift_inner_"+arg).hide();	  
	  }
  function goods_count_adjust(gc_id,count,gift_id){
	  var gcs="";
	  jQuery(":checkbox[id^=id_]").each(function(){
		if(jQuery(this).prop("checked")){
		   var id=jQuery(this).val();
		   gcs=id+","+gcs;
		}												   
		   
	  });
	  if(gcs==""){
	     gcs="-1";//为了和顶部的购物车计算总价区分开，如果gcs为空则会计算购物车所有商品总价，为-1则不会计算任何物品
	  }
 
  }

  function confirm_cart(){
	  var carts_size = jQuery(":checkbox[id^=id_]:checked").length;
	  var gift_size = jQuery("div[id^=gift_list_]").length;
	 if(carts_size>0){
		   var gcs="";
		  jQuery(":checkbox[id^=id_]").each(function(){
			if(jQuery(this).prop("checked")){
			 var id=jQuery(this).val();
			   gcs=id+","+gcs;
			}
		  });
		  if(gift_size>0){
			   var gids="";
			  jQuery("div[id^=gift_list_]").each(function(){
			   var gid=jQuery(this).attr("gogi");
			   gids=gid+","+gids;
		 		 });
			  jQuery("#giftids").val(gids);
			  }
		  jQuery("#gcs").val(gcs);
		  jQuery("#cart_form").submit();		 
			 }else{
				 alert("请选择一件商品");
				 }	 
  }  
jQuery(document).ready(function(){
	//打开页面选择所有商品
  jQuery(":checkbox").prop("checked",true);
	//减少购买数量 
  jQuery("a[id^=count_down]").click(function(){
	var gc_id=jQuery(this).attr("gc_id");
	jQuery(":checkbox[id=id_"+gc_id+"]").prop("checked",true);
	var item = $('#goods_count_' + gc_id);//购买数量文本框
	var count=jQuery("#goods_count_"+gc_id).val();
	//判断是否全选
	var len = jQuery(":checkbox[id^=id_]").length;//判断总长度
    var carts_size = jQuery(":checkbox[id^=id_]:checked").length;//判断选中的长度
    if(carts_size == len ){
   	 	//设置全选按钮为true
		jQuery(":checkbox[id=ids]").prop("checked",true);
		
	}else{
		 //设置全选按钮为false
		jQuery(":checkbox[id=ids]").prop("checked",false);
		
	}
  //判断是否全选结束
	var f_sale_type=parseInt(jQuery(this).attr("f_sale_type"));
	var gift_id=jQuery(this).attr("check_gift_id");	
	if(f_sale_type==0){
	  if(count>1){
	    count--;
	    jQuery("#goods_count_"+gc_id).val(count);
	    item.keyup();
        goods_count_adjust(gc_id,count,gift_id);
	  }
	}else{
	  alert("F码商品一次只能购买一件!");
	}
  });
	//增加购买数量
  jQuery("a[id^=count_up]").click(function(){
	var gc_id=jQuery(this).attr("gc_id");
	jQuery(":checkbox[id=id_"+gc_id+"]").prop("checked",true);
	var item = $('#goods_count_' + gc_id);//购买数量文本框
	var count=jQuery("#goods_count_"+gc_id).val();
	var f_sale_type=parseInt(jQuery(this).attr("f_sale_type"));
	var gift_id=jQuery(this).attr("check_gift_id");	
	//判断是否全选
	var len = jQuery(":checkbox[id^=id_]").length;//判断总长度
    var carts_size = jQuery(":checkbox[id^=id_]:checked").length;//判断选中的长度
    if(carts_size == len ){
   	 	//设置全选按钮为true
		jQuery(":checkbox[id=ids]").prop("checked",true);
		
	}else{
		 //设置全选按钮为false
		jQuery(":checkbox[id=ids]").prop("checked",false);
		
	}
  //判断是否全选结束
	if(f_sale_type==0){
	  if(count>0){
	    count++;
	    jQuery("#goods_count_"+gc_id).val(count);
	    item.keyup();//change_quantity()调用，改变价格
	    goods_count_adjust(gc_id,count,gift_id);
	  }	
	 }else{
	  alert("F码商品一次只能购买一件!");
	}
  });
  jQuery("input[id^=goods_count_]").keyup(function(){
	var gc_id=jQuery(this).attr("gc_id");	
	var count=jQuery("#goods_count_"+gc_id).val().replace(/\D/g,'');
	var f_sale_type=parseInt(jQuery(this).attr("f_sale_type"));
	var gift_id=jQuery(this).attr("check_gift_id");	
	if(count==""){
       count=1;
	}	
	if(f_sale_type==0){
	  if(count>0){
	    goods_count_adjust(gc_id,count,gift_id);
	  }
	  if(count==0){
		jQuery("#goods_count_"+gc_id).val("1");
		goods_count_adjust(gc_id,1,gift_id);
	  }
	}else{	 	
	 alert("F码商品一次只能购买一件!");
	 jQuery("#goods_count_"+gc_id).val("1");
	}
  });
	//统一执行的方法
	function getDisable(){
		$('#total_price').html("总计:¥"+GetTotalPrice()+"元");
	}
	
	//获取总共价格
	function GetTotalPrice(){
		var totalNum=0;
		jQuery(":checkbox[id^=id_]").each(function(i){
		    if($(this).is(':checked')){
		    	var gc_id=jQuery(this).val();
		    	totalNum+=parseFloat($('#gc_totalprice'+gc_id).html());
		    	
		    }
		}); 
		return toDecimal2(totalNum);
	} 
	//准换价格格式
	function toDecimal2(x) {   
	    var f = parseFloat(x);   
	    if (isNaN(f)) {   
	        return false;   
	    }   
	    var f = Math.round(x*100)/100;   
	    var s = f.toString();   
	    var rs = s.indexOf('.');   
	    if (rs < 0) {   
	        rs = s.length;   
	        s += '.';   
	    }   
	    while (s.length <= rs + 2) {   
	        s += '0';   
	    }   
	    return s;   
	}  
  //单个复选框事件
  jQuery(":checkbox[id^=id_]").click(function(){
	    var len = jQuery(":checkbox[id^=id_]").length;//判断总长度
	    var carts_size = jQuery(":checkbox[id^=id_]:checked").length;//判断选中的长度
	    
	    if(carts_size<=0){
		 jQuery("span.go_count a").css("background","#999");
		}else{
		  jQuery("span.go_count a").css("background","#F00");
	    }	
	    
	    if(carts_size == len ){
	   	 	//设置全选按钮为true
			jQuery(":checkbox[id=ids]").prop("checked",true);
			getDisable();
		}else{
			 //设置全选按钮为false
			jQuery(":checkbox[id=ids]").prop("checked",false);
			getDisable();
		}
    
  });
  //全选按钮点击事件
  jQuery(":checkbox[id=ids]").click(function(){
    var val=jQuery(this).prop("checked");//判断是否选中	
	var value = jQuery(this).val();
	if(val){
	  //设置所有商品复选框被选中
	  jQuery(":checkbox[id^=id_]").prop("checked",true);
	  var gc_id=jQuery(":checkbox[id^=id_]:first").val();
	  var totalprice = 0;
	  //计算所有商品总价
	  $(':checkbox[id^=id_]').each(function(){
		  gc_id=$(this).val();
		  totalprice=totalprice+parseFloat($('#gc_totalprice'+gc_id).html());
	  });
	  jQuery("#total_price").html("总计:¥"+totalprice+"元");
	}else{
      jQuery(":checkbox[id^=id_]").prop("checked",false);
	  jQuery(":checkbox[value="+value+"]").prop("checked",false);
	  jQuery(".shopping_table tr").removeClass("this");
	  jQuery("#total_price").html("总计:¥0.00元");
	  jQuery("#enough_reduce_money").hide();
	  jQuery("a[id^=select_gift_]").hide();
	  jQuery("div[id^=gift_inner_]").hide();
	  jQuery("div[id^=gift_list_]").remove();
	  jQuery("#total_price").addClass("total_pri");
	  }
	
  });
 
  jQuery("span.go_count a").css("background","#999");  
 
    jQuery("div[id^=gift_inner_]").find("input").each(function(){                                           
       jQuery(this).click(function(){  
        var test= jQuery(this).attr("checked");    
        if(this.checked){  
         jQuery(this).parent().parent().parent().siblings().removeClass("this").find("input").prop("checked",false);  
		 jQuery(this).parent().parent().parent().addClass("this");
        }     
       });  
      });  
});
function more_big_cart_remove(){
	  	  var gcs="";
		  jQuery(":checkbox[id^=id_]").prop("checked",true).each(function(){
			   var id=jQuery(this).val();
			   var data_bind=jQuery(this).attr("data_bind");
			  	 if(data_bind!=""&&data_bind!=undefined){
				    gcs=data_bind+","+gcs;
				   }else{
					gcs=id+","+gcs;   
					   }
		 	 });
			  if(gcs!=""){
				  big_cart_remove(gcs);		
				}else{
					alert("至少选中一条数据！");	
				}	 
				
	}
	
function big_cart_remove(ids){
			var type=arguments[1];
      			var method = function(){
					   jQuery.post("http://yunjia.rhxtune.com/remove_goods_cart.htm",{"ids":ids},function(data){
							if(type=="one_combin"){
								window.location.href="http://yunjia.rhxtune.com/goods_cart0.htm";
							}else{
								  if(data.code=="100"){
									jQuery.each(data.ids, function(index,remove_id){
										if(remove_id.indexOf("combin")<0){
											jQuery("table.shopping_table tr[id="+remove_id+"]").remove();
											}else{
											jQuery("table.shopping_table tr[data_bind="+remove_id+"]").remove();	
												}						   
									});
									jQuery("li[id^=tr_]").each(function(){
				 					var mark = jQuery(this).attr("mark");
									if(jQuery("tr[mark=if_size_"+mark+"]").size()==0){
									jQuery(this).remove();					
														     }											
														});
									 if(data.count==0){
										jQuery("form[name='cart_form']").remove();
										 
									 }	
									  window.location.reload();}
									 if(data.code=="200"){	
									 alert("系统繁忙，请稍后重试！");
									 }
								}																		  
						 },"json");
					};
			if(type=="one_combin"){
				 if(confirm("删除后其他套装商品将不享受优惠！")){
					  method();
					 }
				
			}
			if(type=="all_combin"){
				if(confirm("确定删除整个组合套装吗！")){
					  method();
					 }
			}
			 if(type=="" || type==undefined){
				 if(confirm("确定删除已选中的商品！")){
					  method();
					 }
			}

       }
function change_spec(obj){
	var obj_id = jQuery(obj).attr("obj_id");
	var div =jQuery("#standard_"+obj_id);
		jQuery("div[id^=standard_]").hide();
		var obj_img = jQuery(obj).attr("obj_img");
		jQuery.post("http://yunjia.rhxtune.com/goods_cart1_spec.htm",{
			"cart_id":obj_id
			},function(data){
				jQuery(div).find(".standard_left").html(data);
				jQuery(div).show().find(".standard_right img").attr("src",obj_img);
				},"text");
	}
function confirm_change_spec(obj){
	var id = jQuery(obj).attr("cart_id");
	var gsp="";
	jQuery(".product_choose_standard").find("#pro_choose_li_standard_"+id).each(function(){
			 jQuery(jQuery(this).find("a[class='choose_notype_standard this']")).each(function(){								 
				 gsp=jQuery(this).attr("gsp")+","+gsp; 
			 });
			 jQuery(jQuery(this).find("a[class='choose_one_standard this']")).each(function(){								 
				 gsp=jQuery(this).attr("gsp")+","+gsp; 
			 });
		});
	jQuery.post("http://yunjia.rhxtune.com/goods_cart1_spec_save.htm",{
			"id":id,
			"gsp":gsp
			},function(data){
				if(data.code==100){
					 lazyload();
					}else{
						alert("未知错误，请刷新页面重试！");
						}
				},"json");
	}	
function cancle_change(){
	jQuery("div[id^=standard_]").hide();
	}	
</script>
<style>
label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	margin-right: 15px;
	font-size: 13px;
	background-color: #F94D4D;
	margin-top:20px;
}
.wrapper {
	width: 500px;
	margin: 50px auto;
}
input[type=radio],input[type=checkbox] {
	display: none;
}
label:before {
	content: "";
	display: inline-block;
	
	width: 20px;
	height: 20px;
	
	margin-right: 10px;
	position: absolute;
	left: 0;
	bottom: 0;
	background-color: #D8D8D8;}

.radio label:before {
	border-radius: 8px;
}
.checkbox label {
	margin-bottom: 10px;
}
.checkbox label:before {
	border-radius: 3px;
}

input[type=checkbox]:checked + label:before {
	content: "\2713";
	font-size: 15px;
	color: #f3f3f3;
	text-align: center;
	line-height: 18px;
	background-color: #F94D4D;
}
</style>
<script>
//更新购物车的小计价格以及总价
	function change_quantity(goods_price, store_id, cart_id, spec_id, input){
	    var subtotal_span = $('#gc_totalprice' + cart_id);//小计
	    var amount_span = $('#total_price');//总价
	    //暂存为局部变量，否则如果用户输入过快有可能造成前后值不一致的问题
	    var count = input.value;
	    if(!isPositiveNum(count)){
	    	layer.open({content:'请填写正确的数字', time: 1});
	    	$(input).val(1);
	    	return false;
	    }
	    if(count<0 || count>100){
	    	layer.open({content:'商品最大购买量在0-100之间', time: 1});
	    	$(input).val(100);
	    	return false;
	    }
	    $.ajax({
	    	url : "${base}/cart/updateCartCount",
	        type : 'post',
	        data : {'cartId' : cart_id,'count' : count,'storeId' : store_id,'specId' : spec_id},
	        dataType : 'json',
	        success : function(data){
	            if(data.success){
	            	var result = data.result;
	            	//更新成功
	                $(input).attr('changed', count);
	              	subtotal_span.html(goods_price*count); //更新商品小计价格
	               	amount_span.html("总计:¥"+result.goodsTotalPrice+"元"); //更新购物车订单总价
	            }else{
	            	//更新失败
	            	layer.open({content:data.msg, time: 1});
	                $(input).val($(input).attr('changed'));
	            }
	        }
	    });
	}
	//单个删除购物车
	function drop_cart_item(cartId){
		var cartIds = cartId + ",";
	    $.ajax({
	    	url : "${base}/m/authc/cart/delete",
	        type : 'post',
	        data : {'cartId' : cartIds},
	        dataType : 'json',
	        success : function(data){
	            if(data.success){
	            	location.reload();
	            }else{
	            	layer.open({content:'删除购物车失败!', time: 1});
	            }
	        }
	    });
	}
	//购物车结算
	function subMit(){
		
		var checkId = "";
		 jQuery(":checkbox[id^=id_]").each(function(i){
	
		    if($(this).is(":checked")){
	
		    	checkId += $(this).val()+",";
		    }
		});
		if(checkId == ""){
			layer.open({content:'请选择购买商品', time: 1});
			return false;
		}else{
			checkId = checkId.substring(0, checkId.length-1);
			window.location.href = "${base}/m/authc/cart/cartOrder?cartIds="+checkId;
		}
	}
</script>
</head>

<body>
<div class="phone_hd">
	<a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>购物车
    <a class="edit" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a>
</div>
<form  method="post"  name="cart_form" target="_self" id="cart_form" action="">
    <input type="hidden" name="giftids" id="giftids" value="" />
	<!--购物车-->
    <div class="car_page">
    	<ul>
        	<!--普通商品-->
        	<#assign cartTag = newTag("cartTag") />
			<#assign cartMap = cartTag() />
	       	<#if cartMap.get("cartVoList")??>
	    		<#list cartMap.get("cartVoList") as cartVo>
		            <p style="line-height:24px; font-size:14px; margin-top:3px; margin-left:5px;">店铺：<a href="#">${cartVo.storeName}</a></p>                    	
		        	<#if cartVo.list??>
		            	<#list cartVo.list as cart>
			        	<li>
			        		<div class="li_box">
				            	<div class="check">
					            	<div class="checkbox">
						            	<input type="checkbox" id="id_${cart.cartId}" mark="" value="${cart.cartId}" name="id"  />
						            	<label for="id_${cart.cartId}" id="label_${cart.cartId}"></label>
					            	</div>
					            </div>
				                <div class="img">
					                <a href="${base}/m/goods/goodsdetail?id=${cart.goodsId}">
					                	<img src="${imgServer}${cart.goodsImages}" alt="${cart.goodsName}" width="60" height="60" />
					                </a>
				                </div>
				                <div class="infro">
					                <span class="name">
					                	<a href="${base}/m/goods/goodsdetail?id=${cart.goodsId}">${cart.goodsName}</a>
					                </span>
					                <span class="num">
					                	<a class="minus" href="javascript:void(0);" id="count_down_${cart.cartId}" gc_id="${cart.cartId}" f_sale_type="0">－</a>
					                	<input  name="goods_count_${cart.cartId}" type="text" id="goods_count_${cart.cartId}" f_sale_type="0" value="${cart.goodsNum}" onkeyup="change_quantity('${cart.goodsPrice}','${cartVo.storeId}','${cart.cartId}','${cart.specId}', this);" gc_id="${cart.cartId}"  goods_count="1" />
					                	<a class="plus" href="javascript:void(0);" id="count_up_${cart.cartId}" gc_id="${cart.cartId}" f_sale_type="0">+</a>
					                </span>
				                </div>
				   				<div class="fr">
				   					<script type="text/javascript">
		              					var price = number_format(${cart.goodsPrice},2);
				              		</script>
					   				<span class="price" id="gc_price${cart.cartId}">单价：¥${cart.goodsPrice}元</span>
					   				
					   				<span class="del">
						   				<a href="javascript:void(0);" onclick="drop_cart_item('${cart.cartId}');">
						   					<img src="${base}/res/html5/images/del.png" width="25" height="25" />
					   					</a>
				   					</span>
				   				</div>
			            	</div>
			            </li>
			     	</#list>
			   	 </#if>
              </#list>
        	</#if>
            
            
            <!--满就减活动-->
			<!--满就赠活动-->
                <script>
         function combin_carts_detail(id){
			 if(id!="" && id!=undefined){
			   var dis = jQuery("#combin_other").css("display");
				   if(dis=="none"){
					   jQuery("#combin_other").show();
					   jQuery.post("http://yunjia.rhxtune.com/combin_carts_detail.htm",
								 {"id":id
									 },function(data){
										 if(data.code==100){
												jQuery("#combin_other_content").show();
												jQuery("#combin_ul").html("");
												jQuery.each(data.map_list,function(index,obj){
														var obj_id = obj.id;
														var obj_img = obj.img;
														var obj_name = obj.name;
														var obj_url = obj.url;
														var obj_price = obj.price;
														var obj_count = obj.count;
														var obj_spec_info = obj.spec_info;
														jQuery("#combin_ul").append("<li><table cellpadding='0' cellspacing='0'><tbody><tr> <td width='22%' align='left'><img src='"+obj_img+"' width='60' height='60' /></td><td width='35%' align='left'><p class='name'>"+obj_name+"</p></td><td align='left'>¥"+obj_price+"元<br /> 数量:"+obj_count+"</td><td align='right'><span class='del'><a href='javascript:void(0);' onclick='big_cart_remove(\""+obj_id+"\",\"one_combin\");'><img src='${base}/res/html5/images/del.png' width='25' height='25' /></a></span></td></tr></tbody></table></li>");  					  
												 });
												
											 }
											if(data.code==-100){
												alert("参数错误，请刷新页面!");
												 }			  
											 },"json"); 
					   }
				 }else{
				 alert("参数错误，请刷新页面!");
				 }
			 };
			 function isPositiveNum(s){//是否为正整数  
			   	var re = /^[0-9]*[1-9][0-9]*$/ ;  
			   	return re.test(s);  
			 } 
         </script>
            <!--组合套装活动开始-->
    	</ul>
    </div>
    <input type="hidden" name="gcs" id="gcs" />
</form>    
    
    <div class="car_pay">
    	<div class="check"> 
	    	<div class="checkbox">
		    	<input type="checkbox" id="ids" />
		    	<label style="margin-top:20px;" for="ids"></label>
	    	</div>
    	</div>
        <div class="total">
	        <p class="price total_pri" id="total_price">总计:¥${cartMap.get('map').get('goodsTotalPrice')}元</p>
	        <span id="enough_reduce_money" style="display:none">
		        <p id="before_price">商品总额:¥0.00元</p>
		        <p id="reduce_price">满就减金额:¥0.00元</p>
       	    </span>
        </div>
        <a class="paymen_btn" href="javascript:void(0)" onclick="subMit();" >结算</a>
   </div>
</body>
</html>
