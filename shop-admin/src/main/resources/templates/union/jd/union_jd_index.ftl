﻿<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
		<title>京东联盟-首页</title>
		<base href="" />
		<link rel=stylesheet type=text/css href="${base}/res/union/jd/css/index_index_2260954297.css" />
		<script type="text/javascript" src="${base}/res/union/jd/js/index_index_2700464122.js"></script>
		<script src="${base}/res/union/jd/js/jcarousellite_1.0.1.pack.js"></script>
		<script type="text/javascript"> 
			$(document).ready(function(){
				$("#user_notice").jCarouselLite({
					speed: 500,
					visible: 1,
					onMouse:true,
					scroll: 1,
					auto: 4000,
					vertical: true
				}); 	
			});
		</script>
	</head>
	<body>
		<div class="topbj" style="background:#EC1A5B;">
			<div class="top">
				<table width="100%" border="0">
	            	<tr> 
	            		<td width="100" rowspan="2"> <img src="${base}/res/union/jd/images/07431232044.png" class="logo" border="0" width="124" height="50"/></td>
	 					<td> <span class="wzwz"> Hi，京东联盟代购欢迎您！</span></td> 
					</tr>
	               	<tr> 
	               		<td>
	               			<span class="wzwz2"> 
	               				
               				</span>
       				</td>
				    </tr>
				</table>
				<div style="padding:0 15px 10px 15px">
		     		<div class="seach">
			 			<form action="${base}/unionJD/list" method="get" name="searchForm" onsubmit="return s8Tijiao($(this))"  target="_blank">
							<input type="text" id="keyword" name="keyword" class="keyW text" value="" placeholder="输入您想要买的商品名称" style="color:#999;" />
							<input type="submit" class="button" value="" />
						</form>
					</div>
				</div>
	      		<div class="gonggao" id="user_notice">
	          		<ul>
	            		<li>
	                		<div class="gonggaotb"></div>
	                		<b><a href="/m/index.php?mod=article&act=list&cid="><font color="#FFFF00">网站公告：</font></a></b> 
	                		<a style="text-decoration:none; font-size:12px" href="/m/index.php?mod=article&act=view&id=43" >京东精选上线啦！</a> 
	            		</li>
	            	</ul>
	    		</div> 
	
	  		</div>			
		</div>	
		<div align="center">
			   <!--幻灯片开始--> 
	    	<div class="hdp">  
	    		<div id="KinSlideshow">
		            <a href="javascript:void(0);"><img src="${base}/res/union/jd/images/19245513894.JPG" alt=""/></a>
		            <a href="javascript:void(0);"><img src="${base}/res/union/jd/images/23392990167.png" alt=""/></a>
	   			</div>
			</div>
	      	     <!--幻灯片结束--> 
			 
				   <!--首页导航图标开始--> 
			<div class="zhutu" style="height:100px">
			
				<a href="${base}/unionJD/list?type=mjs"><span class="span1 span20"></span><span class="span2">满就送</span></a>
				<a href="${base}/unionJD/list?type=jxtm"><span class="span1 span16"></span><span class="span2">精选特卖</span></a>
				<a href="${base}/unionJD/list?type=rx"><span class="span1 span15"></span><span class="span2">热销商品</span></a>
			        
	        </div>  
			  
			    <!--首页导航图标结束--> 
				  	
		  	<#if mjsGoods?exists && mjsGoods?size gt 0>
		    <div class="zdmhot">
		    	<div class="gdzdmtb2"></div>满就送
			   	<span style="float:right; margin-right:10px; font-size:14px;"><a href="${base}/unionJD/list?type=mjs">更多>></a> </span>
		   	</div>
	   	  	<div class="p5">
		
				<ul class="remai2 shuju_load">
	    		<#list mjsGoods as goods>
	        		<li> 
	        			<a href="${base}/unionJD/goodsDetail?id=${goods.id}"> 
			            	<span class="tupian"> 
			            		<img data-original="${goods.imageUrl}" title="${goods.goodsName}" class="lazy" src="" alt="${goods.goodsName}"/>
				            	<span class="new"></span>  
				            </span>  
				            <span class="biaoti">
				            	<font color="#FF9933">[满就送]</font>
				            	${goods.goodsName}
			            	</span>
		                    <span class="jiage">
		                    	<span>￥</span>${goods.unitPrice}
		                    	<#--<del>440.00</del>-->
		                	</span>
	                	</a> 
	           		</li>
	       			<li style="width:2%; background:#F0F0F0"></li>
	       		
	        	 </#list>
	 			</ul>
	
		 		<div class="clear" style="margin-top:25px"></div>  
			</div>	
			</#if>
			
			<#if jxtmGoods?exists && jxtmGoods?size gt 0>
		    <div class="zdmhot">
		    	<div class="gdzdmtb2"></div>精选特卖
			   	<span style="float:right; margin-right:10px; font-size:14px;"><a href="${base}/unionJD/list?type=jxtm">更多>></a> </span>
		   	</div>
	   	  	<div class="p5">
		
				<ul class="remai2 shuju_load">
	    		<#list jxtmGoods as goods>
	        		<li> 
	        			<a href="${base}/unionJD/goodsDetail?id=${goods.id}"> 
			            	<span class="tupian"> 
			            		<img data-original="${goods.imageUrl}" title="${goods.goodsName}" class="lazy" src="" alt="${goods.goodsName}"/>
				            	<span class="new"></span>  
				            </span>  
				            <span class="biaoti">
				            	<font color="#FF9933">[精选特卖]</font>
				            	${goods.goodsName}
			            	</span>
		                    <span class="jiage">
		                    	<span>￥</span>${goods.unitPrice}
		                    	<#--<del>440.00</del>-->
		                	</span>
	                	</a> 
	           		</li>
	       			<li style="width:2%; background:#F0F0F0"></li>
	       		
	        	 </#list>
	 			</ul>
	
		 		<div class="clear" style="margin-top:25px"></div>  
			</div>	
			</#if>
			
			<#if rxGoods?exists && rxGoods?size gt 0>
		    <div class="zdmhot">
		    	<div class="gdzdmtb2"></div>热销商品
			   	<span style="float:right; margin-right:10px; font-size:14px;"><a href="${base}/unionJD/list?type=rx">更多>></a> </span>
		   	</div>
	   	  	<div class="p5">
		
				<ul class="remai2 shuju_load">
	    		<#list rxGoods as goods>
	        		<li> 
	        			<a href="${base}/unionJD/goodsDetail?id=${goods.id}"> 
			            	<span class="tupian"> 
			            		<img data-original="${goods.imageUrl}" title="${goods.goodsName}" class="lazy" src="" alt="${goods.goodsName}"/>
				            	<span class="new"></span>  
				            </span>  
				            <span class="biaoti">
				            	<font color="#FF9933">[热销商品]</font>
				            	${goods.goodsName}
			            	</span>
		                    <span class="jiage">
		                    	<span>￥</span>${goods.unitPrice}
		                    	<#--<del>440.00</del>-->
		                	</span>
	                	</a> 
	           		</li>
	       			<li style="width:2%; background:#F0F0F0"></li>
	       		
	        	 </#list>
	 			</ul>
	
		 		<div class="clear" style="margin-top:25px"></div>  
			</div>	
			</#if>
			       		
		</div>	
		<a href="javascript:scroll(0,0)" hidefocus="true" title="回到顶部" id="scrollTop"></a>
		<script src="${base}/res/union/jd/js/jquery.KinSlideshow-1.2.1.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$("#KinSlideshow").KinSlideshow({
				isHasTitleFont:false,
				isHasTitleBar:false,
				moveStyle:'up',
				btn:{btn_fontHoverColor:"#FFFFFF"}
		 	});
		</script>
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
			});
			
			function index_tpl(){/* <li> <a href="{$url}"><span class="tupian"> <img data-original="{$img}" title="{$title}" class="lazy" src="" alt="{$title}"/> </span>    <span class="biaoti">{$title}</span><span class="jiage"><span>￥</span>{$reserve_price}<del>{$zk_final_price}</del></span>
						 <span class="fanli">{$rebate_word}</span>
			                    </a> </li><li style="width:2%; background:#F0F0F0"></li>*/;}
			
			function jiazai(floorStep){	
				$('.chakan_more').text('数据获取中……');
				var url='http://www.cunboshi.net/m&q='+''+'&page='+floorStep;
				$.getJSON(url,function(data){
					ajaxTag=0;
					if(data.s=='1'){
						if(data.r=='' || data.r=='null' || data.r==null){
							alert('没有了');
							ajaxTag=1;
							$('.chakan_more').hidden();
						}else{
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
	﻿	<script>
			$(function(){ });
			
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