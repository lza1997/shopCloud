<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    
<#--清除缓存	-->
<#assign goodsBaseTag =newTag("goodsBaseInfoTag")>
<#assign goods =goodsBaseTag("{'goodsid':'${goodsId}'}")>
    <title>${goods.goodsName}</title>
    <link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${base}/res/js/jquery.cookie.js" ></script>
    <script src="${base}/res/html5/js/TouchSlide.1.1.js"></script>
    <script src="${base}/res/html5/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${base}/res/js/waypoints.js"></script>
    <!-- 手机端弹出框开始 -->
    <script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
    <!-- 手机端弹出框结束 -->
    <script type="text/javascript" charset="utf-8" src="${base}/res/js/area.js"></script>
    <script>
        var isLogin = false;
        <@shiro.user>
        isLogin = true;
        </@shiro.user>
        var goods_cod = "0";
        var store_price = "216.00";
        jQuery(function () {

            if (goods_cod == "0") {
                jQuery("#show_count").html("x" + jQuery("#count").val());
            } else {
                jQuery("#show_count").html("x" + jQuery("#count").val());
            }
            jQuery("#show_spec").click(function (e) {
                if (jQuery("#spec_count").css("display") == "block") {
                    jQuery("#img_spec").attr("src", "${base}/res/html5/images/details_right.gif");
                    jQuery("#img_spec").attr("width", "9");
                    jQuery("#img_spec").attr("height", "18");
                    if (goods_cod == "0") {
                        jQuery("#show_count").html("x" + jQuery("#count").val());
                    } else {
                        jQuery("#show_count").html("x" + jQuery("#count").val());
                    }
                } else {
                    jQuery("#img_spec").attr("src", "${base}/res/html5/images/details_right_b.gif");
                    jQuery("#img_spec").attr("width", "18");
                    jQuery("#img_spec").attr("height", "9");
                    if (goods_cod == "0") {
                        jQuery("#show_count").html("x" + jQuery("#count").val());
                    } else {
                        jQuery("#show_count").html("x" + jQuery("#count").val());
                    }

                }
                jQuery("#spec_count").toggle();
            });

            jQuery(".details_standard>a").click(function () {
                jQuery(".standard_bottom").slideToggle();
                if (jQuery(this).find("ul").is(".standard_active")) {
                    jQuery(this).find("ul").removeClass("standard_active");
                } else {
                    jQuery(this).find("ul").addClass("standard_active");
                }
            })
            jQuery(".standard_check").not(":eq(0)").each(function () {
                var th = jQuery(this).find("a").first();
                goods_spec_set(th);
            });
            //商品收藏
        });
        <!--end-->
        function goods_spec_set(obj) {
            var spec = jQuery(obj).attr("spec");
            var gsp = "";
            var sname = "";
            var load = true;
            var count = 0;
            jQuery(" li[mark^=spec_] a[spec=" + spec + "]").each(function (index, element) {
                jQuery(element).removeClass("this");
            });
            jQuery(obj).addClass("this");
            jQuery("li[mark^=spec]").each(function () {
                jQuery.each(jQuery(this).find("a[class=this]"), function () {
                    gsp = jQuery(this).attr("gsp") + "," + gsp;
                    if (count == 0) {
                        sname = " " + jQuery(this).attr("sname") + " ";
                    } else {
                        sname = " " + jQuery(this).attr("sname") + " " + sname;
                    }
                    count++;
                });
            });
            jQuery("li[mark^=spec_]").each(function () {
                if (jQuery(this).find("a[class=this]").length == 0) load = false;
            });
            if (sname == "") {
            } else {
                jQuery("#show_spec span[class=fl]").html(sname);
            }
            if (load) {
                jQuery.post("http:///wap/load_goods_gsp.htm", {"id": "11", "gsp": gsp}, function (data) {
                    goods_inventory = data.count;
                    store_price = data.price;
                    if (data.act_price != null) {
                        act_price = data.act_price;
                        jQuery("#act_price").html("¥" + act_price);
                    }
                    jQuery("#goods_inventory").attr("inventory", goods_inventory);
                    jQuery("#goods_inventory").html(goods_inventory + "件");
                    var goods_count = jQuery("#count").val();
                    if (goods_inventory < goods_count) {
                        jQuery("#count").val(goods_inventory);
                    }
                    jQuery("#store_price").html("¥" + store_price);
                }, "json");
            }
        }
    </script>
    <!--添加代码开始-->
    <style>
        .nc-key dl {
            padding: 0;
            margin: 5px 0;
            clear: both;
            width: 100%;
        }

        .nc-key dl dt {
            line-height: 40px;
            display: inline;
            text-align: right;
            white-space: nowrap;
            width: 75px;
            float: left;
        }

        .nc-key dl dd {
            line-height: 30px;
            display: inline;
            float: left;
            margin-left: 4px;
        }

        .nc-key ul li a.hovered {
            border: 2px solid #F30;
            margin: 0px;
            box-shadow: 1px 1px 2px rgba(51, 51, 51, 0.7);
        }

        .nc-key ul li.sp-txt a {
            color: #000;
            text-decoration: none;
            background: #FFF none;
            text-align: center;
            white-space: nowrap;
            min-width: 20px;
            height: 30px;
            padding: 0 5px;
        }

        .nc-key ul li a {
            height: 30px;
            float: left;
            margin: 1px;
            border: 1px solid #E7E7E7;
            position: relative;

            cursor: pointer;
        }

        .nc-key ul li.sp-txt a {
            color: #000;
            text-decoration: none;
            background: #FFF none;
            text-align: center;
            white-space: nowrap;
            min-width: 20px;
            height: 30px;
            padding: 0 5px;
        }

        .nc-key ul li a {
            height: 30px;
            float: left;
            margin: 1px;
            border: 1px solid #E7E7E7;
            position: relative;

            cursor: pointer;
        }

        .nc-key ul li a.hovered i {
            font-size: 0;
            line-height: 0;
            background: url(public.png) no-repeat 0px -40px;
            display: block;
            width: 9px;
            height: 9px;
            position: absolute;

            right: 0px;
            bottom: 0px;
        }

        .nc-key {

            padding-bottom: 15px;

        }

        .nc-key dl dd li {
            float: left
        }
    </style>
    <!--添加代码结束-->
    <script type="text/javascript">
//        商品或店铺收藏开始
        function collect_storeorgoods(goodsId, favType, storeId) {
            $.ajax({
                url: "${base}/Favorite/saveCollection",
                type: 'post',
                data: {'goodsId': goodsId, 'favType': favType, 'storeId': storeId},
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        layer.open({content: data.msg, time: 1});
                        if (data.favType == 1) {
                            $("#img_product").attr("src", "${base}/res/html5/images/star.png");
                            $("#a_product").attr("onclick", "deletefavotitegoods(" + goodsId + "," + favType + "," + storeId + ");");
                        } else {
                            $("#img_store").attr("src", "${base}/res/html5/images/star.png");
                        }
                    } else {
                        layer.open({content: data.msg, time: 1});
                    }
                }
            });
        }
        <!--商品或店铺收藏结束-->
        <!--商品或店铺收藏取消开始-->
        //准备删除
        function deletefavotitegoods(favid, favtype, storeId) {
            var url = '${base}/Favorite/deleteAllFav';
            $.ajax({
                type: "post",
                url: url,
                data: {'favIds': favid, 'favType': favtype},
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.success) {
                        layer.open({content: data.msg, time: 1});
                        if (data.favType == 1) {
                            $("#img_product").attr("src", "${base}/res/html5/images/star_bg.png");
                            $("#a_product").attr("onclick", "collect_storeorgoods(" + favid + "," + favtype + "," + storeId + ");");
                        } else {
                            $("#img_store").attr("src", "${base}/res/html5/images/star_bg.png");
                        }
                    } else {
                        layer.open({content: '取消失败', time: 1});
                    }
                }
            });
        }
        <!--商品或店铺收藏取消结束-->
        <!--添加购物车开始-->
        function isPositiveNum(s) {//是否为正整数
            var re = /^[0-9]*[1-9][0-9]*$/;
            return re.test(s)
        }
        // 商品规格的选择部分
        function buy(type) {
            var ncspec = $(".sp-txt").html(); //判断商品是否存在规格
            var goodsId = ${goodsId}; //商品id
            var goodsNum = $("#count").val(); //商品数量
            var specId = $("#goodsSpecId").val(); //商品规格id
            if (typeof(ncspec) == "undefined") { //若商品没有规格,则将默认规格值存入
                specId = ${goods.specId};
            }
            if (typeof(goodsNum) == "undefined") {
                layer.open({content: '无法购买下架商品', time: 1});
                return;
            } else {
                if (!isPositiveNum(goodsNum)) {
                    layer.open({content: '请填写正确的购买数量', time: 1});
                    $("#show_count").val('1');
                    return;
                }
            }
            max = parseInt($('[nctype="goods_stock"]').text());
            if (goodsNum > max) {
                layer.open({content: '库存不足,请您重新选择商品数量', time: 1});
                return;
            }
            if (specId != '') {
                if (isLogin) {
                    $.ajax({
                        url: "${base}/m/authc/cart/saveCart",
                        type: 'post',
                        data: {'goodsId': goodsId, 'count': goodsNum, 'specId': specId},
                        dataType: 'json',
                        success: function (data) {
                            if (data.success == 'true') {
                                layer.open({content: '加入购物车成功', time: 1});
                                var num = $(".car_num").html(); //购物车原有数量
                                var goodsId = data.goodsId;
                                //更新购物车数量
                                $(".car_num").html(goodsNum * 10 / 10 + num * 10 / 10);
                                window.location = "${base}/m/authc/cart/cartSuccess?goodsId=" + goodsId;
                            } else {
                                layer.open({content: data.msg, time: 1});
                            }
                        }
                    });
                } else {
                    layer.open({content: '请先登录', time: 1});
                    location.href = "${base}/m/index/login";
                }
            } else {
                layer.open({content: '请选择商品规格', time: 1});
            }

        }
        <!--添加购物车结束-->
        <!--立即购买开始-->
        function buynow(type) {
            var ncspec = $(".sp-txt").html(); //判断商品是否存在规格
            var goodsId = ${goodsId}; //商品id
            var goodsNum = $("#count").val(); //商品数量
            var specId = $("#goodsSpecId").val(); //商品规格id
            if (typeof(ncspec) == "undefined") { //若商品没有规格,则将默认规格值存入
                specId = ${goods.specId};
            }
            if (typeof(goodsNum) == "undefined") {
                layer.open({content: '无法购买下架商品', time: 1});
                return;
            } else {
                if (!isPositiveNum(goodsNum)) {
                    layer.open({content: '请填写正确的购买数量', time: 1});
                    $("#show_count").val('1');
                    return;
                }
            }

            max = parseInt($('[nctype="goods_stock"]').text());
            if (goodsNum > max) {
                layer.open({content: '库存不足,请您重新选择商品数量', time: 1});
                return;
            }
            if (specId != '') {
                if (isLogin) {
                    $.ajax({
                        url: "${base}/m/authc/cart/buyNow",
                        type: 'post',
                        data: {'goodsId': goodsId, 'count': goodsNum, 'specId': specId},
                        dataType: 'json',
                        success: function (data) {
                            if (data.success == 'true') {
                                window.location = "${base}/m/authc/cart/gotoOrder?cartIds=" + data.cartIds;
                            } else {
                                layer.open({content: data.msg, time: 1});
                            }
                        }
                    });
                } else {
                    layer.open({content: '请先登录', time: 1});
                    location.href = "${base}/m/index/login";
                }

            } else {
                layer.open({content: '请选择商品规格', time: 1});
            }
        }
        <!--立即购买结束-->
    </script>

</head>

<body class="index_bg">
<div class="phone_hd">
    <a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25"/></a>
    商品详情
</div>
<div class="details_index">
    <input type="hidden" id="goodsSpecId" value=""/>
    <div class="details_top">
        <div class="details_photo" id="details_photo">
            <div class="deta_photo">
                <ul>
                <#assign goodsImgTag =newTag("goodsGallyTag")>
                <#assign goodsImgList =goodsImgTag("{'goodsid':'${goodsId}'}")>
                <#if goodsImgList??>
                    <#list goodsImgList as il>
                        <li><img src=${imgServer}${il}></li>
                    </#list>
                </#if>
                </ul>
            </div>
        </div>
        <script type="text/javascript">
            TouchSlide({
                slideCell: "#details_photo",
                mainCell: ".deta_photo ul",
                effect: "left",
                autoPlay: true,//自动播放
                switchLoad: "_src" //切换加载，真实图片路径为"_src"
            });
        </script>
        <section>
            <div class="details_price" style="height:45px;">
                <ul>
                    <li class="details_price_money"><strong nctype="goods_price" id="store_price">¥${goods.goodsStorePrice}</strong></li>
                    <li class="details_price_money">${goods.goodsName}</li>
                </ul>
                <span>
		       	 	<#if '${isCollection}'==0>
                        <a id="a_product" href="javascript:void(0)" onclick="collect_storeorgoods('${goods.goodsId}','1','${goods.storeId}');"
                           class="details_star" style="font-size: 13px">
		                	<img id="img_product" src="${base}/res/html5/images/star_bg.png" mark="0">商品
		                </a>
                    <#else>
                        <a id="a_product" href="javascript:void(0)" onclick="deletefavotitegoods('${goods.goodsId}','1','${goods.storeId}');"
                           class="details_star" style="font-size: 13px">
		                	<img id="img_product" src="${base}/res/html5/images/star.png" mark="0">商品
		                </a>
                    </#if>
                        <!-- <a href="javascript:void(0)" onclick="collect_storeorgoods('-9','2','${goods.storeId}');" class="details_star">
			        	<img id="img_store" src="${base}/res/html5/images/star_bg.png" mark="0">店铺
			        </a>   -->
		        </span>
            </div>
        </section>
        <!-- <div class="name">
            当前商品为促销商品，用户登录后方可享受促销价格！
     </div>    -->
    </div>

    <!--商品规格及配送-->

    <div class="details_box">
    <#if goods.goodsShow != 0>
        <dl class="stand">
            <dt id="show_spec"><span class="fl">选择 数量  &nbsp;&nbsp;&nbsp;<span id="show_count"></span></span>
                <span class="fr"><img id="img_spec" src="${base}/res/html5/images/details_right.gif" width="9" height="18"/></span></dt>
            <dd id="spec_count" style="display:none;font-size: 14px">
                <ul>
                    <li><span class="fl">库存：</span><strong nctype="goods_stock" id="goods_inventory" inventory="45465">${goods.goodsTotalStorage}件</strong></li>
                    <li><span class="fl">数量：</span><span class="num"><a class="minus" href="javascript:void(0);" onClick="minus()">－</a><input type="text"
                                                                                                                                               id="count"
                                                                                                                                               name="count"
                                                                                                                                               value="1"/><a
                            class="plus" href="javascript:void(0);" onClick="plus()">+</a></span></li>
            </dd>
        </dl>
        <!--  <dl class="stand">
         <dt>
             <span class="fl">送至：</span>
             <span class="sel">
             <select onChange="query_area_data(area_1);" id="area_1">
                             <option value="4521984" area_id="4521984" area_name="北京">北京</option>
                             <option value="4523980" area_id="4523980" area_name="湖南">湖南</option>
                             <option value="4524130" area_id="4524130" area_name="广东">广东</option>
                             <option value="4524292" area_id="4524292" area_name="广西">广西</option>
                             <option value="4524431" area_id="4524431" area_name="海南">海南</option>
                             <option value="4524460" area_id="4524460" area_name="重庆">重庆</option>
                             <option value="4524503" area_id="4524503" area_name="四川">四川</option>
                             <option value="4524724" area_id="4524724" area_name="贵州">贵州</option>
                             <option value="4524825" area_id="4524825" area_name="云南">云南</option>
                             <option value="4524979" area_id="4524979" area_name="西藏">西藏</option>
                             <option value="4525061" area_id="4525061" area_name="陕西">陕西</option>
                             <option value="4525189" area_id="4525189" area_name="甘肃">甘肃</option>
                             <option value="4525302" area_id="4525302" area_name="青海">青海</option>
                             <option value="4525355" area_id="4525355" area_name="宁夏">宁夏</option>
                             <option value="4523850" area_id="4523850" area_name="湖北">湖北</option>
                             <option value="4523655" area_id="4523655" area_name="河南">河南</option>
                             <option value="4523480" area_id="4523480" area_name="山东">山东</option>
                             <option value="4522003" area_id="4522003" area_name="天津">天津</option>
                             <option value="4522022" area_id="4522022" area_name="河北">河北</option>
                             <option value="4522217" area_id="4522217" area_name="山西">山西</option>
                             <option value="4522359" area_id="4522359" area_name="内蒙古">内蒙古</option>
                             <option value="4522482" area_id="4522482" area_name="辽宁">辽宁</option>
                             <option value="4522611" area_id="4522611" area_name="吉林">吉林</option>
                             <option value="4522689" area_id="4522689" area_name="黑龙江">黑龙江</option>
                             <option value="4522847" area_id="4522847" area_name="上海">上海</option>
                             <option value="4522868" area_id="4522868" area_name="江苏">江苏</option>
                             <option value="4523000" area_id="4523000" area_name="浙江">浙江</option>
                             <option value="4523113" area_id="4523113" area_name="安徽">安徽</option>
                             <option value="4523253" area_id="4523253" area_name="福建">福建</option>
                             <option value="4523357" area_id="4523357" area_name="江西">江西</option>
                             <option value="4525388" area_id="4525388" area_name="新疆">新疆</option>
                         </select></span>
             <span class="sel1" style="display:none">
             <select id="city" onChange="trans_fee()">
             </select>
             </span>

         </dt>
         </dl> -->

        <dl class="stand" id="trans_fee">
            <dt>
	       		<span class="fl">
                    <#if '${goods.goodsTransfeeCharge}'==1>
                        卖家承担
                    <#else>
                        买家承担
                    </#if>
	        	</span>
            </dt>
        </dl>
        <div class="nc-key" style="font-size: 14px">
            <#assign goodsSpecTag =newTag("goodsSpecTag")>
            <#assign goodsSpecObj =goodsSpecTag("{'goodsid':'${goodsId}'}")>
            <!--S 店铺信息-->
            <#assign storeInfoTag =newTag("storeInfoTag")>
            <#assign storeinfo =storeInfoTag("{'storeId':'${goods.storeId}'}")>
            <#if goodsSpecObj != null>
                <#assign nameMap = goodsSpecObj.get("specname")>
                <#assign valueMap = goodsSpecObj.get("specvalue")>
                <#assign goodsSpecs = goodsSpecObj.get("goodsSpecs")>
                <#assign goodsColImg = goodsSpecObj.get("goodsColImg")>
                <#if nameMap?? && nameMap!=null>
                    <#list nameMap.keySet() as key>
                        <dl>
                            <dt style="width:56px;">${nameMap.get(key)}</dt>
                            <dd>
                                <ul nctyle="ul_sign">
                                    <!-- 文字类型规格-->
                                    <#if valueMap?? >
                                        <#list valueMap[key] as goodsSpecMapValues>
                                            <li class="sp-txt">
                                                <a href="javascript:void(0)" spId="${key}" spValueId="${goodsSpecMapValues.spValueId}"
                                                   onClick="selectSpec('${goodsSpecMapValues.spId}', this, '${goodsSpecMapValues.spValueId}')" class="">
                                                ${goodsSpecMapValues.spValueName}
                                                    <#if key==1>
                                                        <#if goodsColImg?? && goodsColImg!''>
                                                            <#list goodsColImg?keys as goodsColImgKey>
                                                                <#if goodsSpecMapValues.spValueId==goodsColImgKey>
                                                                    <img alt="" src="${imgServer}${goodsColImg[goodsColImgKey]}"
                                                                         style="height: 25px;width: 25px;">
                                                                </#if>
                                                            </#list>
                                                        </#if>
                                                    </#if>

                                                    <i></i>
                                                </a>
                                            </li>
                                        </#list>
                                    </#if>
                                </ul>
                            </dd>
                        </dl>
                        </dl>
                    </#list>
                </#if>
            </#if>
        </div>
    <#else>
        <div class="nc-key">
            商品已下架
        </div>
    </#if>
        <dl class="stand" style=" border-top:1px solid #eee;">
            <a href="${base}/m/goods/goodsIntroduce?goodsId=${goodsId}&isShow=1">
                <dt>
                    <span class="fl">商品详情</span>
                    <span class="fr">
		    		<img src="${base}/res/html5/images/details_right.gif" width="9" height="18"/>
		    	</span>
                </dt>
            </a>
        </dl>
        <dl class="stand">
            <a href="${base}/m/goods/goodsConsultList?goodsId=${goodsId}">
                <dt>
		    	<span class="fl">
		    		在线咨询<span class="gray"></span>
		    	</span>
                    <span class="fr">
		    		<img src="${base}/res/html5/images/details_right.gif" width="9" height="18"/>
		    	</span>
                </dt>
            </a>
        </dl>
        <dl class="stand">
            <a href="${base}/m/goods/goodsEvaluteList?goodsId=${goodsId}&isShow=1">
                <dt>
	        	<span class="fl">
	        		商品评价<span class="gray"></span>
	    	    </span>
                    <span class="fr">
	    	    	<img src="${base}/res/html5/images/details_right.gif" width="9" height="18"/>
	   	   	    </span>
                </dt>
            </a>
        </dl>
    </div>
    <!-- 评价标签 -->
<#assign goodsEvaluteScollbyGoodsIdTag =newTag("goodsEvaluteScollbyGoodsIdTag")>
<#assign avearageScoll =goodsEvaluteScollbyGoodsIdTag("{'goodsId':'${goodsId}'}")>
    <!--评价等-->
    <div class="evaluation_top">
        <div class="evaluation_top_box"><b>商品评分：</b><span><i style="width:${avearageScoll*20}%"></i></span><strong>${avearageScoll}分</strong></div>
        <!--  <ul>
           <li class="this"><span>好评：<br/>
             <i>0.0%</i></span>
           </li>
           <li><span>中评：<br/>
             <i>0.0%</i></span>
           </li>
           <li><span>差评：<br/>
             <i>0.0%</i></span>
           </li>
         </ul> -->
    </div>
    <div class="loading" id="loading" style="display:none">
        <ul>
            <li><img src="${base}/res/html5/images/loading.gif" width="16" height="16"></li>
            <li>正在加载....</li>
        </ul>
    </div>
    <div style="height:10px;"></div>
    <div class="details_total">

        <div class="gouwu-left-btn">
            <a href="http://free.appkefu.com/AppKeFu/float/weixin/chat.php?wg=12345671&robot=false&goods=true&goodspic=${imgServer}${goods.goodsImage}&goodsname=${goods.goodsName}&goodsprice=¥${goods.goodsStorePrice}&goodsurl=http%3a%2f%2fyunjia.rhxtune.com%2fm%2fgoods%2fgoodsdetail%3fid%3d${goods.goodsId}&postscript=http%3a%2f%2fyunjia.rhxtune.com%2fm%2fgoods%2fgoodsdetail%3fid%3d${goods.goodsId}" target="_blank" class="into_store into_store1">
                <img src="${base}/res/html5/images/serviceimg.png" width="22" height="22"><br>客服
            </a>
            <#if goods.storeId!=0>
                <a href="${base}/m/index/shop?storeId=${goods.storeId}" target="_blank"" class="into_store">
                    <img src="${base}/res/html5/images/home_ico.png" width="22" height="22"><br>进店
                </a>
            </#if>

            <#if 1=='${isLogin}'>
                <a href="${base}/m/authc/cart/cartGoodsList" class="details_enjoy">
            <#else>
                <a href="${base}/m/index/login" class="details_enjoy">
            </#if>
                <img src="${base}/res/html5/images/gouwuche_ico.png" width="22" height="22">
                <i class="car_num">${cartNum.goodsNum}</i><br>
                购物车
            </a>

        </div>

        <div class="gouwu-btn">
            <a href="javascript:buy('');" class="add_car">加入购物车</a>
            <a href="javascript:buynow('');" class="atonce">立即购买</a>
        </div>


    </div>
</div>

</body>
</html>
<script>
    /* spec对象 */
    function spec(id, spec, price, stock) {
        this.id = id;
        this.spec = spec;
        this.price = price;
        this.stock = stock;
    }
    /* goodsspec对象 */
    function goodsspec(specs, specQty, defSpec) {
        this.specs = specs;
        this.specQty = specQty;
        this.defSpec = defSpec;
        this.spec1 = null;
        this.spec2 = null;
        this.spec3 = null;
        this.spec4 = null;
        if (this.specQty >= 1) {
            for (var i = 0; i < this.specs.length; i++) {
                if (this.specs[i].id == this.defSpec) {
                    this.spec1 = this.specs[i].id;
                    this.spec2 = this.specs[i].spec;
                    this.spec3 = this.specs[i].price;
                    this.spec4 = this.specs[i].stock;
                    break;
                }
            }
        }


        // 取得选中的spec
        this.getSpec = function () {
            for (var i = 0; i < this.specs.length; i++) {
                if (this.specs[i].spec != this.spec2) continue;
                return this.specs[i];
            }
            return null;
        }

    }
    var specs = new Array();
    var source_goods_price = '${goods.goodsStorePrice}';
    var specQty;
    var defSpec = '${goods.specId}';
    var goodsspecc;

    //异步请求获得sku信息
    function getSku(callbackfunction) {
        var url = "${base}/product/goodsSpecs";
        var args = {"goodsId":${goodsId}};
        $.post(url, args, function (data) {
            //goodsSpecs是个list
            var goodsSpecs = data.goodsSpecs;
            specs = new Array();
            for (var i = 0; i < goodsSpecs.length; i++) {
                var goodsSpec = goodsSpecs[i];
                specs.push(new spec(goodsSpec.goodsSpecId,
                        goodsSpec.specValueIdStr.split(","),
                        goodsSpec.specGoodsPrice,
                        goodsSpec.specGoodsStorage));
            }
            specQty = goodsSpecs.length;
            goodsspecc = new goodsspec(specs, specQty, defSpec);
            if (callbackfunction != undefined) {
                callbackfunction();
            }
        });
    }

    function init() {
        getSku(function () {
            var tatolStorage = 0;
            //计算总库存
            for (var i = 0; i < specQty; i++) {
                tatolStorage += parseInt(specs[i].stock);
            }
            $("[nctype=goods_stock]").html(tatolStorage);
        });

        //异步地址
        var url = '${base}/product/goodsBody';
        //参数
        var agrs = {
            "goodsId":${goodsId}
        };

    }

    $(function () {
        //初始化
        init();
    });


    /* 选中某规格 num=1,2 */
    function selectSpec(num, liObj, SID) {
        getSku();
        $(liObj).addClass("hovered");
        $(liObj).parents('li').siblings().find('a').removeClass("hovered");
        var sign = 't';
        var spValueId = "";
        $('ul[nctyle="ul_sign"]').each(function () {
            if ($(this).find('.hovered').html() == null) {
                sign = 'f';
            }
            spValueId += $(this).find('.hovered').attr("spValueId") + ",";
        });
        spValueId = spValueId.substring(0, spValueId.length - 1);
        goodsspecc['spec2'] = spValueId;
        var spec = goodsspecc.getSpec();
        if (spec != null && sign == 't') {
            $('[nctype="goods_price"]').html("&yen;" + spec.price);
            //限时折扣价格
            $('[nctype=goods_stock]').html(spec.stock);
            if (parseInt(spec.stock) == 0) {
                //$('[nctype="goods_prompt"]').show().html('<dt>提示：</dt><dd><em class="no fl">所选规格库存量不足，请选择其它规格购买。</em></dd>');
            } else {
                SP_V = '';
                $('ul[nctyle="ul_sign"]').find('li > .hovered').each(function (i) {
                    SP_V += $(this).text() + '，';
                });
                SP_V = SP_V.substr(0, SP_V.length - 1);
                //$('[nctype="goods_prompt"]').show().html('<dt>提示：</dt><dd><em class="yes fl">您选择了：'+SP_V+'</em></dd>');
                $("#goodsSpecId").attr("value", spec.id);
            }
        }
    }
</script>

<script>
    jQuery(function () {
        jQuery("#count").keyup(function (e) {
            var count = jQuery("#count").val().replace(/\D/g, '');
            if (count == "") {
                count = 1;
            }
            var goods_inventory = jQuery("#goods_inventory").attr("goods_inventory") - 0;
            if (count > goods_inventory) {
                jQuery("#count").val(goods_inventory);
            } else if (count < 1) {
                jQuery("#count").val(1);
            } else {
                jQuery("#count").val(count);
            }
            if (goods_cod == "0") {
                jQuery("#show_count").html("x" + jQuery("#count").val());
            } else {
                jQuery("#show_count").html("x" + jQuery("#count").val());
            }
        });

		saveGoodsCookie();

    })
    
    function saveGoodsCookie(){
      //保存商品的cookie信息
	var goodsId='${goods.goodsId}';
	var goodsName='${goods.goodsName}';
	var goodsImage='${goods.goodsImage}';
	var goodsStorePrice='${goods.goodsStorePrice}';
	 
	 
	 //获取用户历史浏览记录，如果已经存在浏览历史，则分析历史记录的cookie信息（JSON数据格式），获取记录长度。
	 var canAdd = true; //初始可以插入cookie信息 
	 var hisGoods = $.cookie("hisGoods"); 
	 var len = 0; 
	 if(hisGoods){ 
	    hisGoods = eval("("+hisGoods+")"); 
	    len = hisGoods.length; 
	 } 
	 
	 //如果浏览历史cookie信息已经存在，则遍历cookie信息，对比当前文章标题，如果cookie信息中已经存在当前文章标题，则中止程序，不做任何操作
	 $(hisGoods).each(function(){
	    if(this.goodsId == goodsId){
	        canAdd = false; //已经存在，不能插入
	        return false;
	    } 
      });
	// 如果浏览历史cookie中不存在当前商品，则可以像浏览历史cookie中插入当前文章的cookie信息。
	//此时需要构建json数据，将已有的浏览记录cookie和当前页面的cookie信息已经组合成JSON数据，然后通过$.cookie()方法写入到浏览历史记录中
	if(canAdd==true){ 
		var json = "["; 
		var start = 0; 
	    if(len>4){start = 1;} 
	    for(var i=start;i<len;i++){ 
	        json = json + "{\"goodsId\":\""+hisGoods[i].goodsId+"\",\"goodsName\":\""+hisGoods[i].goodsName+"\",\"goodsImage\":\""+hisGoods[i].goodsImage+"\",\"goodsStorePrice\":\""+hisGoods[i].goodsStorePrice+"\"},"; 
	    } 
	    json = json + "{\"goodsId\":\""+goodsId+"\",\"goodsName\":\""+goodsName+"\",\"goodsImage\":\""+goodsImage+"\",\"goodsStorePrice\":\""+goodsStorePrice+"\"}]";
	    $.cookie("hisGoods",json,{expires:7,path:'/'});//expires 保存cookie的天数
	}
}
    
    function query_area_data(area_1) {
        var aid = jQuery("#area_1").val();
        jQuery.ajax({
            type: 'POST',
            url: 'http:/wap/buyer/address_add_ajax.htm',
            data: {"aid": aid},
            success: function (data) {
                var dataObj = eval("(" + data + ")");
                jQuery(".brand_class_box ul").html("");
                var html = "";
                jQuery(dataObj.data).each(function (index) {
                    html = html + "<option value=" + dataObj.data[index].addr_name + ">" + dataObj.data[index].addr_name + "</option>"
                });
                jQuery("#city").html(html);
                jQuery(".sel1").show();
            }
        }, "json");
    }
    function trans_fee() {
        var city_name = jQuery("#city").val();
        jQuery.ajax({
            type: 'POST', url: 'http://b2b2c.iskyshop.com/trans_fee.htm', dataType: 'json', data: {"city_name": city_name, "goods_id": "11"},
            success: function (json) {
                jQuery("#trans_fee").show();
            }
        });
    }
    function plus() {
        var cc = jQuery("#count").val() - 0;
        var goods_inventory = jQuery("#goods_inventory").attr("goods_inventory") - 0;
        if (cc >= goods_inventory) {
            jQuery("#count").val(goods_inventory);
        } else {
            jQuery("#count").val(cc + 1);
        }
        if (goods_cod == "0") {
            jQuery("#show_count").html("x" + jQuery("#count").val());
        } else {
            jQuery("#show_count").html("x" + jQuery("#count").val());
        }
    }
    function minus() {
        var cc = jQuery("#count").val() - 0;
        if (cc <= 1) {
            jQuery("#count").val(1);
        } else {
            jQuery("#count").val(cc - 1);
        }
        if (goods_cod == "0") {
            jQuery("#show_count").html("x" + jQuery("#count").val());
        } else {
            jQuery("#show_count").html("x" + jQuery("#count").val());
        }
    }

</script>
