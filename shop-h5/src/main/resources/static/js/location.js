/**
 * Created by huziwang on 2016/11/29.
 */
;!function(window){
    var win=window,
        doc=win.document,
        docEle=doc.documentElement,
        objhtml=doc.getElementsByTagName('html')[0],
        width=docEle.clientWidth,
        size='fontSize',
        html=function(obj,key,value){return obj.style[key]=value+'px';};
    html(objhtml,size,width/7.5);
    console.log(docEle);
    win.onresize=function(){
        var objDoc=win.document,
            objDocEle=objDoc.documentElement,
            objHtml=objDoc.getElementsByTagName('html')[0],
            objWidth=objDocEle.clientWidth;
        html(objHtml,size,objWidth/7.5);
    };
}(window);