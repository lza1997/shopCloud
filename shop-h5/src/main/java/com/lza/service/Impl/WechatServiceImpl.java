package com.lza.service.Impl;

import com.alibaba.fastjson.JSONObject;
import com.lza.common.WachatContent;
import com.lza.service.wechatService;
import com.lza.utils.WeixinUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class WechatServiceImpl implements wechatService {
    //snsapi_base获得openid
    public String getopenIdbysnsapibase(String Appid, String appSecret,
                                        String code) {
        String requestUrl=WachatContent.getaccesstoken+"appid="+Appid+"&secret="+appSecret+"&code="+code+"&grant_type=authorization_code";
        String openid="";
        //获取网页授权凭证
        JSONObject jsonobject=WeixinUtil.httpRequest(requestUrl,"GET",null);
        if(jsonobject!=null && jsonobject.containsKey("openid")){
            openid=jsonobject.getString("openid");
        }
        return openid;
    }

}
