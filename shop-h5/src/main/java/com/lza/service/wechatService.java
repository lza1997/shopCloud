package com.lza.service;

public interface wechatService {

    //snsapi_base获得openid
    public String getopenIdbysnsapibase(String Appid,String appSecret,String code);
}
