<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
		<title><#if type='mjs'>满就送<#elseif type='jxtm'>精选特卖<#elseif type='rx'>热销</#if>-首页</title>
		<base href="" />
		<link rel=stylesheet type=text/css href="${base}/res/union/jd/css/goods_index_2260954297.css" />
		<script type="text/javascript" src="${base}/res/union/jd/js/goods_index_960609130.js"></script>
		<style type="text/css">
			.jl_tj{ width:99%; height:38px;line-height:38px; text-align:center; display:block; background:#fff; border:1px #E7E7E7 solid; color:#000; cursor:pointer; font-size:1.4em;border-radius:3px; }
			.jl_tj:hover{ opacity:0.8; }
			.jl_tj2{ width:100%; height:38px;line-height:38px; text-align:center; display:block; background:#EC1A5B;  color:#fff; cursor:pointer; font-size:1.4em;border-radius:3px; }
			.jl_tj2:hover{ opacity:0.8; }
			.register_dl{ width:100%; height:45px; background:#EC1A5B;border:0; color:#FFFFFF; font-weight:500;font-family:Microsoft YaHei;  cursor:pointer; font-size:18px;border-radius:2px; }
			.register_dl:hover{ opacity:0.8; }
			.tijiao{ width:80px; height:37px; background:#EC1A5B;border:0; color:#FFFFFF; cursor:pointer; font-size:16px; }
			.tijiao:hover{ opacity:0.8; }
			.register_tc{ background:#fff; border:1px #E7E7E7 solid; margin:0 10px 0 10px;text-align:center;margin-top:10px;margin-bottom:10px;padding:12px;border-radius:3px; }
			.register_tc a{font-size:16px; color:#EC1A5B;}
			.register_tc:hover{ opacity:0.8; }
			.nr img{ width:300px;}
		</style>
		<script>
			var floorStep=2;
			var ajaxTag=0;
			$(function(){
				$(window).bind('scroll',function(){
					if($(window).scrollTop()+$(window).height()>=$(document).height()-400){
						if(ajaxTag==0){
							ajaxTag=1;
							jiazai(floorStep);
							floorStep++;
							
						}
					}
				});
				$('.shuju_load img.lazy').lazyload({
					threshold:20,
					failure_limit:50
				});
				
				$(".search_icon").click(function (){
					if($(".serach_form_div").css("display")=="none"){
						$(".serach_form_div").show();
					}
				});
				
				$(".close_search_form_div").click(function (){
					$(".serach_form_div").hide();
				});
				
				
			});
			function index_tpl(){/*<li> <a href="${base}/unionJD/goodsDetail?id={$id}"><span class="tupian"> <img data-original="{$imageUrl}" title="{$goodsName}" class="lazy" src="" alt="{$goodsName}"/> </span>    <span class="biaoti"><font color="#FF9933">[{$type}]</font>{$goodsName}</span><span class="jiage"><span>￥</span>{$unitPrice}</span>  
			
			                    </a> </li><li style="width:2%; background:#f0f0f0"></li>*/;}
			
			function jiazai(floorStep){	
				
				$('.chakan_more').text('数据获取中……');
				var url='${base}/unionJD/listForJSON?type=${type!''}&classId=${classId!''}&keyword=${keyword!''}&pageNo='+floorStep;
				$.getJSON(url,function(data){
					ajaxTag=0;
					if(data.s=='1'){
						if(data.r=='' || data.r=='null' || data.r==null){
							//alert('没有了');
							ajaxTag=1;
							$('.chakan_more').hide();
						}
						else{
							for(i in data.r){
								row=data.r[i];
								var html=getTplObj(index_tpl,row);
								$('.shuju_load').append(html);
								
							}
							$('.chakan_more').text('点击更多');
							$('.shuju_load img.lazy').lazyload({
								threshold:20,
								failure_limit:50
							});
						}
					}
				});
			}
			
		</script>
	</head>
	<body>
		
		<div style="padding:10px 15px 10px 15px;display: none;" class="serach_form_div">
     		<div class="seach" style="width:80%;float:left">
	 			<form action="${base}/unionJD/list" method="get" name="searchForm" onsubmit="return s8Tijiao($(this))"  target="_blank">
	 				<input type="hidden" name="type" value="${type!''}"/>
	 				<input type="hidden" name="classId" value="${classId!''}"/>
					<input type="text" id="keyword" name="keyword" class="keyW text" value="${keyword!''}" placeholder="输入您想要买的商品名称" style="color:#999;" />
					<input type="submit" class="button" value="" />
				</form>
			</div>
			<div>
				<a href="javascript:void(0);" class="close_search_form_div" style="float: left;height: 42px;line-height: 42px;text-align: center;background: #fff;width: 65px;margin-left: 10px;border-radius: 4px;">
					<img src="${base}/res/union/jd/images/arrow_up.png" style="margin-top: 4px;"/>
				</a>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		<div class="yingdao" align="center" style="background:#EC1A5B;">
			<p>
				<b><#if type='mjs'>满就送<#elseif type='jxtm'>精选特卖<#elseif type='rx'>热销<#else>商品列表</#if></b>
				<a href="javascript:;" onclick="history.back()" title="返回" class="left"></a> 
				<a href='javascript:void(0);' title="搜索" class="right search_icon"></a> 
			</p>
		</div>  


		<div align="center">
			<div class="zhutu2">
				<a href="${base}/unionJD/list?type=${type!''}<#if pClass?exists>&classId=${pClass.id}</#if>">
					<img src="${base}/res/union/jd/images/all-3.png"/>
					<span class="span2">全部<#if pClass?exists && pClass.id!=0>${pClass.name}<#else>分类</#if></span>
				</a>
			<#list goodsClasss as goodsClass>
				<a href="${base}/unionJD/list?type=${type!''}&classId=${goodsClass.id}">
					<img src="${imgServer}${goodsClass.icon}"/>
					<span class="span2">${goodsClass.name}</span>
				</a>
        	</#list>
 			</div>  
	  
		</div> 
	   
		<div class="p5">
			<#if goodsList?size gt 0>
    		<ul class="remai2 shuju_load">
			<#list goodsList as goods>
	        	<li > 
	        		<a href="${base}/unionJD/goodsDetail?id=${goods.id}" > 
			            <span class="tupian"> 
			            	<img data-original="${goods.imageUrl}" title="${goods.goodsName}" class="lazy" src="" alt="${goods.goodsName}" border="0" /> 
			            </span>                    
			            <span class="biaoti">
				            <font color="#FF9933">[${goods.type!''}]</font>
				            ${goods.goodsName}
			            </span>
	                 	<span class="jiage">
		                 	<span>￥</span>${goods.unitPrice}		                    
		                 	<#--<del>28.00</del>--> 		                 
	                 	</span>
                       
                    </a> 
                </li>
                <li style="width:2%; background:#f0f0f0"></li>
                
            </#list>
			</ul>
			<#else>
			<div style="text-align:center">暂无相关商品</div>
			</#if>
		</div>
		<a class="chakan_more">上拉加载更多</a>
		<div class="megas513" style="padding:10px; "></div>

  		<a href="javascript:scroll(0,0)" hidefocus="true" title="回到顶部" id="scrollTop"></a>
		﻿<script>
			$(function(){});
			function close_tishi(){
				setCookie('close_tishi',1);
				$('.down_app').hide();
			}
			
			function s8Tijiao($t){
				var v=$t.find('.keyW').val();
				if(v==''){
					alert('请输入搜索内容');
					return false;
				}
			}
		</script>

		<div class="footer footer_b">
			<p class="gwcLogin">
				
				<a href="javascript:void(0);" >登录</a>
				<a href="javascript:void(0);">帮助中心</a>
				<a href="${base}/unionJD/index">首页</a>
			</p>
		</div>

		<div class="copyright"></div>	

  
		<div align="center">
			<div class="nav4" style="position:fixed;bottom:0;left:0;width:100%;height:80px;line-height:80px;background:#fff;z-index:9999;border-top: 1px solid #eee;">
				<div id="nav4_ul" class="nav_4">
					<ul class="box">
						<li style="line-height:130px;float:left;">
							<a href="${base}/unionJD/index" >
								<img src="${base}/res/union/jd/images/ft11.png" class="lazy2" width="50"/>
							</a>
							<span  class="sub" style="margin-left:-20px;">首  页</span>
						</li>
						<li style="line-height:130px;float:left;">
							<a href="${base}/unionJD/list?type=mjs">
								<img src="${base}/res/union/jd/images/ft2.png" class="lazy2" style="margin-right:-25px; " width="50"/>
								<span  style="margin-left:-20px;">满就送</span>
							</a>
							
						</li>
						<li style="line-height:130px;float:left;">
							<a href="${base}/unionJD/list?type=jxtm">
								<img src="${base}/res/union/jd/images/ft3.png" class="lazy2" width="50"/>
								<span  style="margin-left:-20px;">精  选</span>
							</a>
						</li>
						<li style="line-height:130px;float:left;">
							<a href="javascript:void(0)">
								<img src="${base}/res/union/jd/images/ft4.png" class="lazy2" width="50"/>
								<span  style="margin-left:-20px;">帮  助</span>
							</a>
						</li>
						<li style="line-height:130px;float:left;">
							<a href="${base}/unionJD/memberCenter">
								<img src="${base}/res/union/jd/images/ft5.png" class="lazy2" width="50"/>
								<span  style="margin-left:-20px;">我  的</span>
							</a>
							
						</li>
					
					</ul>
				</div>
			</div>
		</div>

	</body>
</html>