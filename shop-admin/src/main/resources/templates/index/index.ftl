<@p.header title="lza">
<script>
    //
    $(document).ready(function () {
        $('span.bar-btn').click(function () {
            $('ul.bar-list').toggle('fast');
        });
    });

    $(document).ready(function(){
        buildMenu();
        var pagestyle = function() {
            var iframe = $("#workspace");
            var h = $(window).height() - iframe.offset().top;
            var w = $(window).width() - iframe.offset().left;
            if(h < 300) h = 300;
            if(w < 973) w = 973;
            iframe.height(h);
            iframe.width(w);
        }
        pagestyle();
        $(window).resize(pagestyle);
        //turn location
        if($.cookie('now_menu_id') != null){
            openItem($.cookie('now_menu_id'),$.cookie('now_sub_menu_id'));
        }else{
            $('#mainMenu>ul').first().css('display','block');
            var first_sub_menu = $('#mainMenu>ul').first().find("a").first();
            $(first_sub_menu).addClass('selected');
            //第一次进入后台时，默认定到欢迎界面
            $("#nav>ul>li").first().children("a").addClass('actived');
            $('#workspace').attr('src',$(first_sub_menu).attr("url"));
        }
        $('#iframe_refresh').click(function(){
            var fr = document.frames ? document.frames("workspace") : document.getElementById("workspace").contentWindow;;
            fr.location.reload();
        });

    });
    //收藏夹
    function addBookmark(url, label) {
        if (document.all)
        {
            window.external.addFavorite(url, label);
        }
        else if (window.sidebar)
        {
            window.sidebar.addPanel(label, url, '');
        }
    }


    function openItem(menu_id, sub_menu_id){
        closeBg();
        //var menu_id = arguments[0];
        $('.actived').removeClass('actived');
        $('#'+menu_id).addClass('actived');
        $('.selected').removeClass('selected');
        $('#mainMenu ul').css('display','none');
        $('#sort_'+menu_id).css('display','block');
        if (!sub_menu_id) {

            var first_obj = $('#sort_'+menu_id+'>li>dl>dd>ol>li').first().children('a');
            $(first_obj).addClass('selected');
            $('#crumbs').html('<span>'+$('#'+menu_id+' > span').html()+'</span><span class="arrow">&nbsp;</span><span>'+$(first_obj).text()+'</span>');
            $('#workspace').attr('src',$(first_obj).attr("url"));
        }else{
            //var sub_menu_id = arguments[1];
            $.cookie('now_menu_id',menu_id);
            $.cookie('now_sub_menu_id',sub_menu_id);
            $("#" + sub_menu_id).addClass("selected");
            $('#crumbs').html('<span>'+$('#'+menu_id+' > span').html()+'</span><span class="arrow">&nbsp;</span><span>'+$("#"+sub_menu_id).text()+'</span>');
            $('#workspace').attr('src',$("#"+sub_menu_id).attr("url"));
        }

    }

    //菜单权限加载
    function buildMenu(){
		$.ajax({
			type: "GET",
         	url:"${base}/getMenuJSON",
         	dataType: "json",
		 	success:function(data) {
				var menus = data;
			 	if(menus.length>0){
					var menuHtml = "<ul>";
		        	var subMenuHtml = "";
		        	var indexId;
			        for (var i = 0; i < menus.length; i++) {
			            var menu = menus[i];
			            if(i == 0){
			        		indexId = menu.mid;
			        	} 
			            menuHtml+='<li><a class="link" id="'+menu.mid+'" href="javascript:;" onclick="openItem(\''+menu.mid+'\');"><span>'+menu.mname+'</span></a></li>';
			            var subMenus = menu.menuClassList;
			            subMenuHtml+='<ul id="sort_'+menu.mid+'"><li><dl><dd><ol>';
			            for (var j = 0; j < subMenus.length; j++) {
			                var sub = subMenus[j];
			                subMenuHtml+='<li><a href="javascript:void(0);" url="'+APP_BASE+sub.murl+'" name="'+sub.mid+'" id="'+sub.mid+'" onclick="openItem(\''+menu.mid+'\',\''+sub.mid+'\');">'+sub.mname+'</a></li>';
			            }
			            subMenuHtml+='</ol></dd></dl></li></ul>';
			        }
			        menuHtml+="</ul>";
			        $("#nav").html(menuHtml);
			        $("#mainMenu").append(subMenuHtml);
			        openItem(indexId);
				}else{
					layer.msg("加载菜单出错" , {icon:2});
				} 
			},
			error:function(e){
				layer.msg("加载菜单出错" , {icon:2});
			}
		});
	}
</script>
<script type="text/javascript">
    //显示灰色JS遮罩层
    function showBg(ct,content){
        var bH=$("body").height();
        var bW=$("body").width();
        var objWH=getObjWh(ct);
        $("#pagemask").css({width:bW,height:bH,display:"none"});
        var tbT=objWH.split("|")[0]+"px";
        var tbL=objWH.split("|")[1]+"px";
        $("#"+ct).css({top:tbT,left:tbL,display:"block"});
        $(window).scroll(function(){resetBg()});
        $(window).resize(function(){resetBg()});
    }
    function getObjWh(obj){
        var st=document.documentElement.scrollTop;//滚动条距顶部的距离
        var sl=document.documentElement.scrollLeft;//滚动条距左边的距离
        var ch=document.documentElement.clientHeight;//屏幕的高度
        var cw=document.documentElement.clientWidth;//屏幕的宽度
        var objH=$("#"+obj).height();//浮动对象的高度
        var objW=$("#"+obj).width();//浮动对象的宽度
        var objT=Number(st)+(Number(ch)-Number(objH))/2;
        var objL=Number(sl)+(Number(cw)-Number(objW))/2;
        return objT+"|"+objL;
    }
    function resetBg(){
        var fullbg=$("#pagemask").css("display");
        if(fullbg=="block"){
            var bH2=$("body").height();
            var bW2=$("body").width();
            $("#pagemask").css({width:bW2,height:bH2});
            var objV=getObjWh("dialog");
            var tbT=objV.split("|")[0]+"px";
            var tbL=objV.split("|")[1]+"px";
            $("#dialog").css({top:tbT,left:tbL});
        }
    }

    //关闭灰色JS遮罩层和操作窗口
    function closeBg(){
        $("#pagemask").css("display","none");
        $("#dialog").css("display","none");
    }
</script>
<script type="text/javascript">
    function addFavorite(url, title) {
        try {
            window.external.addFavorite(url, title);
        } catch (e){
            try {
                window.sidebar.addPanel(title, url, '');
            } catch (e) {
                showDialog("请按 Ctrl+D 键添加到收藏夹", 'notice');
            }
        }
    }
</script>
</@p.header>
<body style="margin: 0px;" scroll="no">
<div id="pagemask"></div>
<table style="width: 100%;" id="frametable" height="100%" width="100%" cellpadding="0" cellspacing="0">
    <tbody>
    <tr>
        <td colspan="2" height="90" class="mainhd"><div class="layout-header"> <!-- Title/Logo - can use text instead of image -->
            <div id="title"><a href="#"></a></div>
            <!-- Top navigation -->
            <div id="topnav" class="top-nav">
                <ul>
                    <li class="adminid" title="您好:admin">您好&nbsp;:&nbsp;<strong><@shiro.principal/></strong></li>
                    <li><a href="${base}/changePwd" target="workspace" ><span>修改密码</span></a></li>
                    <li><a href="${base}/logout" title="退出"><span>退出</span></a></li>
                    <li><a href="${frontServer}" target="_blank" title="商城首页"><span>商城首页</span></a></li>
                    <li><a href="${sellerServer}" target="_blank" title="商城首页"><span>商家管理中心</span></a></li>
                </ul>
            </div>
            <!-- End of Top navigation -->
            <!-- Main navigation -->
            <nav id="nav" class="main-nav">
				<ul>
					<li><a class="link actived" id="index_menu" href="javascript:;"><span>首页</span></a></li>
				</ul>
            </nav>
            <div class="loca"><strong>您的位置:</strong>
                <div id="crumbs" class="crumbs"><span>控制台</span><span class="arrow">&nbsp;</span><span>欢迎页面</span> </div>
            </div>
        </div>
            <div > </div></td>
    </tr>
    <tr>
        <td class="menutd" valign="top" width="161">
            <div id="mainMenu" class="main-menu">

            </div>
        </td>
        <td valign="top" width="100%"><iframe src="" id="workspace" name="workspace" style="overflow: visible;" frameborder="0" width="100%" height="100%" scrolling="yes" onload="window.parent"></iframe></td>
    </tr>
    </tbody>
</table>
</body>
</html>
