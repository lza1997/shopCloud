<@p.header title="日志管理">
</@p.header>
<body>
	<div style="width:400px;text-align:center;margin:0 auto;">
    	<h3 class="cont-tit">日志详情</h3>
        <div class="form-mod">
            <input type="hidden" name="id" value="${adminLog.id}"/>
            <p class="item"><label class="tit"><i class="must">*</i>操作人</label>
                ${adminLog.adminName}
            </p>
            <p class="item"><label class="tit">行为</label>
            	${adminLog.content}
            </p>
            <p class="item"><label class="tit">时间</label>
                ${adminLog.createdTime}
            </p>
            <p class="item"><label class="tit">IP</label>
                ${adminLog.ip}
            </p>
        </div>
	</div>
</body>
