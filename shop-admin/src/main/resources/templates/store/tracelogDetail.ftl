<@p.header title="动态详情">
</@p.header>
<body>
	<div style="width:400px;text-align:center;margin:0 auto;">
    	<h3 class="cont-tit">动态详情</h3>
        <div class="form-mod">
            <input type="hidden" name="id" value="${traceLog.traceId}"/>
            <p class="item"><label class="tit"><i class="must">*</i>店铺名称</label>
                ${traceLog.traceMembername}
            </p>
            <p class="item"><label class="tit">动态标题</label>
            	${traceLog.traceTitle}
            </p>
            <p class="item"><label class="tit">动态内容</label>
                ${traceLog.traceContent}
            </p>
            <p class="item"><label class="tit">发布时间</label>
                ${traceLog.createdTime}
            </p>
        </div>
	</div>
</body>
