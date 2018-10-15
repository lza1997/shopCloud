<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
		<title>${goods.goodsName!''}</title>
		<base href="" />
		<link rel=stylesheet type=text/css href="${base}/res/union/jd//css/goods_view_2260954297.css" />
		<script type="text/javascript" src="${base}/res/union/jd//js/goods_view_960609130.js"></script>
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
	</head>
	<body>
		
		<#--
		<div style="padding:10px 15px 10px 15px;display: none;" class="serach_form_div">
     		<div class="seach" style="width:80%;float:left">
	 			<form action="" method="get" name="searchForm" onsubmit="return s8Tijiao($(this))"  target="_blank">
					<input type="hidden" name="mod" value="goods" /><input type="hidden" name="act" value="index" />
					<input type="text" id="keywords" name="q" class="keyW text" value="" placeholder="输入您想要买的商品名称" style="color:#999;" />
					<input type="submit" class="button" value="" />
				</form>
			</div>
			<div>
				<a href="javascript:void(0);" class="close_search_form_div" style="float: left;height: 42px;line-height: 42px;text-align: center;background: #fff;width: 65px;margin-left: 10px;border-radius: 4px;">取消搜索</a>
			</div>
			<div style="clear: both;"></div>
		</div>
		-->
		
		<div class="yingdao" align="center" style="background:#EC1A5B;">
			<p>
				<b>商品详情</b>
				<a href="javascript:;" onclick="history.back()" title="返回" class="left"></a> 
				<#--<a href='javascript:void(0);' title="搜索" class="right search_icon"></a>--> 
			</p>
		</div>  
		<div class="goodsBody">
			<dl class="goods ">
			    <dt><img src="${goods.imageUrl!''}" width='320' style="display:block" height='320' alt='${goods.goodsName!''}' /></dt>
			    <dd>
			    	<p class="p1">${goods.goodsName!''}</p><!--最多18个字-->
		            <p class="p2">
		            	<span class="span1">价格</span>
		            	<span class="span2"><font>¥<#if goods.unitPrice== -1>未查询到改商品单价<#else>${goods.unitPrice!'0.00'}</#if>元</font></span>
		            	<#--
		            	&nbsp;
		            	<span class="span1" style="margin-left:10px"> 原价</span>
		            	<span class="span2"><s>¥440.00元</s></span>
		            	-->
	            	</p>
			      	   		 
			      	<p class="p2">
			      		<span class="span1">商家</span>
			      		<span class="span2">京东</span>
			      		<!--<span class="span1" style="margin-left:10px"> 销量</span><span class="span2">0 件</span>-->
		      		</p>   
			  	</dd>
	            <div style=" width:200px; margin:auto">
	            	<#--http://service.weibo.com/share/mobile.php?title=竖条纹万向轮20/22/24寸拉杆箱登机旅行箱包行李箱男女密码箱包邮&pic=http://img3.tbcdn.cn/tfscom/i3/TB1d9cDIVXXXXXtXFXXXXXXXXXX_!!0-item_pic.jpg&url=http://www.cunboshi.net/m/index.php?mod=goods&act=view&id=375708&rec=0&summary=赚钱是一种能力，花钱是一种技术，我能力有限，技术却很高。幸好及时发现了，挣钱能力虽然没涨，但省钱能力猛增！！-->
	     			<a style="display:inline-block;" title="分享到新浪微博" href="javascript:void(0);">
	     				<img src="${base}/res/union/jd/images/sina.png" width="100%" />
	     			</a>
	     			<#--http://openmobile.qq.com/oauth2.0/m_jump?loginpage=loginindex.html&logintype=qzone&page=qzshare.html&summary=赚钱是一种能力，花钱是一种技术，我能力有限，技术却很高。幸好及时发现了，挣钱能力虽然没涨，但省钱能力猛增！！&imageUrl=http://img3.tbcdn.cn/tfscom/i3/TB1d9cDIVXXXXXtXFXXXXXXXXXX_!!0-item_pic.jpg&url=http://www.cunboshi.net/m/index.php?mod=goods&act=view&id=375708&rec=0&title=竖条纹万向轮20/22/24寸拉杆箱登机旅行箱包行李箱男女密码箱包邮&callbackUrl=http://www.cunboshi.net/m/index.php?mod=goods&act=view&id=375708&rec=0-->
		          	<a style="display:inline-block;" title="分享到QQ空间" href="javascript:void(0);">
		          		<img src="${base}/res/union/jd/images/qzone.png" width="100%" />
		          	</a>
		          	<#--http://share.v.t.qq.com/index.php?c=share&a=index&title=竖条纹万向轮20/22/24寸拉杆箱登机旅行箱包行李箱男女密码箱包邮&pic=http://img3.tbcdn.cn/tfscom/i3/TB1d9cDIVXXXXXtXFXXXXXXXXXX_!!0-item_pic.jpg&url=http://www.cunboshi.net/m/index.php?mod=goods&act=view&id=375708&rec=0&summary=赚钱是一种能力，花钱是一种技术，我能力有限，技术却很高。幸好及时发现了，挣钱能力虽然没涨，但省钱能力猛增！！-->
		         	<a style="display:inline-block;" href="javascript:void(0);">
		         		<img src="${base}/res/union/jd/images/txweibo.png" width="100%" />
		         	</a>
	         	</div>
		  	</dl>
	      
			<p class="buy"> 
	     		<a href="<#if errorCode?exists && errorCode=='subUnionId_is_null'>javascript:alert('客官，您太着急了，都忘记登录啦！');<#elseif errorCode?exists && errorCode=='token_invalid'>javascript:alert('现在暂时不能提供购买，快点联系平台管理员重新授权');<#else>${jdUrl!''}</#if>" target="_blank"class="left">去网站购买</a>
	  
	  			<a href="javascript:;" onClick="history.back()" class="right">返回列表</a>
	  		</p>
	
	  		<p class="line"></p>
		</div>
		﻿<script>
			$(function(){
				<#--
				$(".search_icon").click(function (){
					if($(".serach_form_div").css("display")=="none"){
						$(".serach_form_div").show();
					}
				});
				
				$(".close_search_form_div").click(function (){
					$(".serach_form_div").hide();
				});
				-->
			});
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