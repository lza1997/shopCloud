package com.lza.controller;

import com.lza.common.WachatContent;
import com.lza.entiry.Member;
import com.lza.service.MemberService;
import com.lza.service.wechatService;
import com.lza.utils.RandCodeImageUtils;
import com.lza.utils.UsernamePasswordToken;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
@RequestMapping("/m/index")
public class IndexHtml5Action {

    private static final Logger log = LoggerFactory.getLogger(IndexHtml5Action.class);

    @Resource
    private wechatService   wechatService;

    @Autowired
    private MemberService memberService;

    @RequestMapping(value={"generateImage"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
    public void generateImage(HttpServletResponse response, HttpServletRequest request)
            throws  IOException
    {
        RandCodeImageUtils.generateImage(response, request);
    }

    @RequestMapping("/index")
    public ModelAndView index(@RequestParam(value="codeId", required=false) String codeId, @RequestParam(value="code", required=false) String code)
    {
        ModelAndView model=new ModelAndView();
        String weiopenid = "";
        try
        {
            if (StringUtils.isNotEmpty(codeId))
            {
                code = code.substring(6);
                Subject subject = SecurityUtils.getSubject();
                Member m = this.memberService.findById(Integer.valueOf(codeId));
              UsernamePasswordToken token = new UsernamePasswordToken(m.getMemberName(), code.toCharArray(), false, "", "", false);
               subject.login(token);
            }
            else if (StringUtils.isNotEmpty(code))
            {
                Subject subjectwei = SecurityUtils.getSubject();
                if (!subjectwei.isAuthenticated())
                {


                    weiopenid = this.wechatService.getopenIdbysnsapibase(WachatContent.appid, WachatContent.appsecret, code);
                    if (StringUtils.isNotBlank(weiopenid))
                    {
                        Session sessionwei = subjectwei.getSession();
                        if (sessionwei.getAttribute("weiopenid") == null) {
                            sessionwei.setAttribute("weiopenid", weiopenid);
                        }
                       // checkmember(weiopenid);
                    }
                }
            }
            model.setViewName("/html5/index/index");
            return model;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            log.error("首页加载失败");
            throw new RuntimeException("导航失败!");
        }
    }
}


