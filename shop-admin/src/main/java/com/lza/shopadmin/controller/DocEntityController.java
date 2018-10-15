package com.lza.shopadmin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.lza.shopadmin.common.Constants;
import com.lza.shopadmin.entity.DocEnEntity;
import com.lza.shopadmin.service.DocEntityService;
import com.lza.shopadmin.utils.Pager;

import org.apache.commons.lang.StringUtils;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import lombok.extern.slf4j.Slf4j;


/**
 *
 * 项目名称：shop-admin
 * 类名称：DocEntityController
 * 类描述：文档实体管理
 * 创建人：lza
 * 创建时间：2016年5月04日 10:52:19
 */
@Controller
@RequestMapping("/doc/api/docentity")
@Slf4j
public class DocEntityController {

    @Autowired
    private DocEntityService docEntityService;

    /**
     * 获取文档实体列表
     * @param model
     * @param pageNoStr
     * @param name
     * @return
     */

    @RequestMapping("/list")
    public String list(
            Model model,
            @RequestParam(value = "pageNo", required=false, defaultValue = "1") String pageNoStr,
            @RequestParam(value = "name", required=false, defaultValue = "") String name,
            @RequestParam(value = "docid", required=false, defaultValue = "") String docid
    ) {
        try {
            Pager pager = new Pager();
            pager.setPageSize(6);
            if (null != pageNoStr && !pageNoStr.equals("")) {
                pageNoStr = pageNoStr.replace("," , "");
                pager.setPageNo(Integer.parseInt(pageNoStr));
            }

            DocEnEntity doc = new DocEnEntity();
            if(StringUtils.isNotEmpty(name)){
                doc.setName(name);
            }

            pager.setCondition(doc);

            List<DocEnEntity> resultList = docEntityService.getDocEntityList(pager);

            pager.setResult(resultList);

            model.addAttribute("docentity", resultList);
            model.addAttribute("pager", pager);
            model.addAttribute("name", name);
            if(StringUtils.isEmpty(docid)){
                return "/doc/api/docentitylist";
            }else{
                model.addAttribute("docid", docid);
                return "/doc/api/docentityandreflist";
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("获取实体列表失败!");
        }
    }

    /**
     * 新增实体
     * @return
     */

    @RequestMapping("/add")
    public String add(){
        return "/doc/api/docentityadd";
    }

    /**
     * 修改或新增实体
     * @return
     */

//    @RequestMapping("/saveOrUpdate")
//    public String saveOrUpdate(
//            @ModelAttribute DocEnEntity docEn,
//            HttpServletRequest request,
//            Model model
//    ){
//        model.addAttribute("referer", CommonConstants.ADMIN_SERVER + "/doc/api/docentity/list");
//        CacheUser user = CacheUtil.getCacheUser();
//        Admin admin = user.getAdmin();
//        if(docEn.getId() == null){
//            docEn.setCreatedby(admin.getAdminName());
//            docEntityService.saveDocEntity(docEn);
//            model.addAttribute("msg", "新增成功");
//        }else{
//            DocEnEntity findDoc = docEntityService.getDocEntityById(docEn.getId());
//            if(null == findDoc){
//                log.warn("未找到，Id=" + docEn.getId());
//            } else {
//                docEn.setUpdateby(admin.getAdminName());
//                docEntityService.updateDocEntity(docEn);
//                model.addAttribute("msg", "修改成功");
//            }
        //}
      //  return Constants.MSG_URL;
   // }

    /**
     * 根据id获取API文档
     * @param model
     * @param id
     * @return
     */

    @RequestMapping(value = "/findById")
    public String findByid(Model model,
                           @RequestParam(required = false, value = "id", defaultValue = "") int id){
        DocEnEntity doc = docEntityService.getDocEntityById(id);
        model.addAttribute("doc", doc);
        return "/doc/api/docentityedit";
    }

    /**
     * 删除实体
     * @param ids
     * @param model
     * @return
     */

    @RequestMapping(value = "/delDoc")
    public String deleteDoc(@RequestParam(value = "ids") String ids,
                            Model model, HttpServletRequest request){

        String referer = request.getHeader("Referer");
        model.addAttribute("referer", referer);
        if (StringUtils.isBlank(ids)) {
            model.addAttribute("result", "ID为空");
            model.addAttribute("msg", "删除失败，ID为空");
        }else{
            String[] idArray = StringUtils.split(ids, ",");
            for (String idStr : idArray) {
                docEntityService.deleteDocEntity(Integer.parseInt(idStr));
            }
            model.addAttribute("msg", "删除成功");
        }
        return Constants.MSG_URL;
    }

    /**
     * 获取所有的实体
     * @return
     */

    @RequestMapping(value = "/allDoc")
    @ResponseBody
    public List<DocEnEntity> getAllEntity(){
        List<DocEnEntity> list = docEntityService.getAllDocEntityList();
        return list;
    }
}
