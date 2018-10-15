package com.lza.shopadmin.controller;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.lza.shopadmin.entity.*;
import com.lza.shopadmin.service.*;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 *
 * 项目名称：shop-admin
 * 类名称：DocViewController
 * 类描述：API文档预览
 * 创建人：lza
 * 创建时间：2018年5月08日 14:00:00
 */
@Controller
@RequestMapping("/doc/view")
public class DocViewController {
    @Autowired
    private DocService docService;
    @Autowired
    private DocEntityRefService docEntityRefService;
    @Autowired
    private DocEntityService docEntityService;
    @Autowired
    private DocParamService docParamServiceImpl;
    @Autowired
    private DocReturnValueService docReturnValueServiceImpl;
    @Autowired
    private DocEntityProService docEntityProService;

    /**
     * 预览首页
     *
     * @param model
     * @param pid
     * @param status
     * @return
     */
    @RequestMapping("/index")
    public String list(
            Model model,
            @RequestParam(value = "pid", required = false, defaultValue = "0") int pid,
            @RequestParam(value = "status", required = false, defaultValue = "2") int status
    ) {
        try {
            return "/doc/view/index";
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("获取文档列表首页失败!");
        }
    }

    /**
     * API预览详细列表
     *
     * @param
     * @param
     * @param typeid
     * @return
     */
    @RequestMapping("/docapilist")
    @ResponseBody
    public JSONObject apiList(
          Model model,
            @RequestParam(value = "id", required = false, defaultValue = "0") int id,
            @RequestParam(value = "typeid", required = false, defaultValue = "1") int typeid
    ) {
      JSONObject jsonObject=new JSONObject();
        try {
            // 获取当前api
            DocEntity docApi = new DocEntity();
            docApi = docService.getDocById(id);

            // 获取当前api下的接口列表
            DocEntity doc = new DocEntity();
            doc.setStatus(1);
            doc.setTypeid(typeid);
            // id==pid
            doc.setPid(id);
            List<DocEntity> docList = docService.getAllDocList(doc);

            // 获取当前api下的数据结构列表
            List<Map<String, String>> refList = docEntityRefService.getAllRefList(id);

            model.addAttribute("docApi", docApi);
            model.addAttribute("doclist", docList);
            model.addAttribute("refList", refList);
            jsonObject.put("result",1 );
            jsonObject.put("msg", "返回数据正常");
            jsonObject.put("data", docApi);
            return jsonObject;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("获取文档列表详细失败");
        }
    }

    /**
     * 获取api详细
     *
     * @param model
     * @param id
     * @param typeid
     * @return
     */
    @RequestMapping("/docapidetail")
    public String docapi(
            Model model,
            @RequestParam(value = "id", required = false, defaultValue = "0") int id,
            @RequestParam(value = "typeid", required = false, defaultValue = "1") int typeid
    ) {
        try {
            // 获取当前api
            DocEntity docApi = new DocEntity();
            docApi = docService.getDocById(id);

            // 获取当前api下的输入参数列表，无分页
            List<DocParamEntity> paramList = docParamServiceImpl.getAllParamList(id);

            // 获取当前api下的返回值
            DocReturnValueEntity returnValue = docReturnValueServiceImpl.getReturnValueByDocId(id);

            model.addAttribute("docApi", docApi);
            model.addAttribute("paramList", paramList);
            model.addAttribute("returnValue", returnValue);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("获取文档列表详细失败");
        }
        return "/doc/view/docapidetail";
    }

    /**
     * 获取实体详细
     *
     * @param model

     * @return
     */
    @RequestMapping("/docentitydetail")
    public String docentitydetail(
            Model model,
            @RequestParam(value = "entityid", required = false, defaultValue = "0") int entityid,
            @RequestParam(value = "docid", required = false, defaultValue = "0") int docid
    ) {
        try {
            // 获取实体详细
            DocEnEntity docen = new DocEnEntity();
            docen = docEntityService.getDocEntityById(entityid);

            List<DocEnProEntity> prolist = docEntityProService.getAllProList(entityid);

            model.addAttribute("docEn", docen);
            model.addAttribute("docEnProList", prolist);
            model.addAttribute("docid", docid);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("获取文档列表详细失败");
        }
        return "/doc/view/entitydetail";
    }
}

