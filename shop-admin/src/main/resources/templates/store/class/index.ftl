<@p.header title="demo">
<script type="text/javascript" src="${base}/res/jquery.dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${base}/res/js/grid.js"></script>
<script type="text/javascript" src="${base}/res/js/commons.js"></script>

<link href="${base}/res/jquery.dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
</@p.header>

<body>
	<div class="iframebox">
		<div class="cont-tit">
			<ul>
			<li style="margin-right: 20px">
				<h3>店铺分类</h3>
			</li>
			
			
				<li>
					<a href="${base}/store/classs/index" class="current"><span style="color:#F0F;background-position: 100% -240px;">管理&nbsp;</span></a>
				</li>
				<li>
					<a href="javascript:opertest(0)" class="current"><span>新增一级分类&nbsp;</span></a>
				</li>
				<li>
					<a href="JavaScript:gotos(0);" class="current"><span>导入(未完成)&nbsp;</span></a>
				</li>
				<li>
					<a href="JavaScript:void(0);" class="current"><span>导出(未完成)&nbsp;</span></a>
				</li>
			</ul>
		</div>
		<br/>
        <div class="control-mod">
            <form id="acct-form" method="post" action="">
            	<input type="hidden" id="div" value = "#dataListDiv"/>
            </form>
        </div>
        <div style="width:100%;" id="dataListDiv"></div>
        <div id="aa_bb">
        	
			123
    	</div>
	</div>
	
</body>
<script type="text/javascript">
	/*界面初始化*/
	$(function(){
		initDataList(0);
	});
	
	//初始化
	function initDataList(parentId){
		var div = "#dataListDiv";//显示的list 数据div id 必须传递 
		$.ajax({
            async:false,
            url:"${base}/store/classs/list",//默认加载list 页面
            data:{div:div},
            error:function(){frameControl.lhDgFalInfo("通讯失败!");},
            dataType:'html',
            type: "POST",
			contentType:"application/x-www-form-urlencoded; charset=utf-8", 
            success: function(data){
				$(div).empty();
				$(div).html(data);
				$(div).hide();
				$(div).fadeIn(300);
				if(parentId!=""&&parentId!=0){
					var trs = $("tr[class='c_"+parentId+"']");
					for(i = 0; i < trs.length; i++){
						trs[i].style.display = "";
					}
			
					var Span1=$('#p_show_'+parentId);
					var Span2=$('#p_hide_'+parentId);
					Span1.css("display","none");
					Span2.css("display","block");
					
					$body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
					alert('#p_'+parentId);
					alert($('#p_'+parentId).offset().top);
					$body.animate({scrollTop: $('#p_'+parentId).offset().top}, 1000);
				}
			}
        });
	}	
	
	/*添加父节点内容*/
	function opertest(id){
		var url = "${base}/store/classs/addIndex?Id="+id;
		frameOperate.prepareUpdate('update','添加/修改',url,840,400,false);
	}
	
	/*修改内容*/
	function update(id){
		var url = "${base}/store/classs/updateIndex?Id="+id;
		frameOperate.prepareUpdate('update','添加/修改',url,840,400,false);
	}
	
	/*修改内容*/
	function gotos(){
	  $body =$("workspace").contents().find("body");
	  alert($body);
	  alert($('#aa_bb').offset().top);
      $body.animate({scrollTop: 600}, 1000);

	}
	</script>
  
