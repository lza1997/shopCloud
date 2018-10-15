package com.lza.shopadmin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import com.lza.shopadmin.common.Constants;
import com.lza.shopadmin.entity.DocEntity;
import com.lza.shopadmin.service.DocService;
import com.lza.shopadmin.utils.Pager;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import lombok.extern.slf4j.Slf4j;

/**
 *
 * 项目名称：shop-admin
 * 类名称：DocController
 * 类描述：文档管理
 * 创建人：lza
 * 创建时间：2018年4月22日 10:52:19
 */
@Controller
@RequestMapping("/doc/api")
@Slf4j
public class DocApiController {

    @Resource
    private DocService docService;// 文档管理接口

    /**
     * API列表页
     *
     * @param model
     * @param pageNoStr
     * @param typeid
     * @param pid
     * @param name
     * @return
     */

    @RequestMapping("/list")
    public String list(
            Model model,
            @RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
            @RequestParam(value = "pid", required = false, defaultValue = "0") int pid,
            @RequestParam(value = "name", required = false, defaultValue = "") String name,
            @RequestParam(value = "status", required = false, defaultValue = "2") int status,
            @RequestParam(value = "typeid", required = false, defaultValue = "1") int typeid
    ) {
        try {
            Pager pager = new Pager();
            pager.setPageSize(6);
            if (null != pageNoStr && !pageNoStr.equals("")) {
                pageNoStr = pageNoStr.replace(",", "");
                pager.setPageNo(Integer.parseInt(pageNoStr));
            }

            DocEntity doc = new DocEntity();
            if (StringUtils.isNotEmpty(name)) {
                doc.setName(name);
            }
            doc.setTypeid(typeid);
            doc.setPid(pid);
            if (0 == status) {
                doc.setStatus(status);
            }
            if (1 == status) {
                doc.setStatus(status);
            }

            pager.setCondition(doc);

            List<DocEntity> resultList = docService.getDocList(pager);

            pager.setResult(resultList);

            model.addAttribute("doc", resultList);
            model.addAttribute("pager", pager);
            model.addAttribute("name", name);
            model.addAttribute("status", status);
            model.addAttribute("pid", pid);
            model.addAttribute("typeid", typeid);
            if (0 != pid) {
                return "/doc/api/docapilist";
            } else {
                return "/doc/api/doclist";
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("获取文档列表失败!");
        }
    }

    /**
     * 新增API
     *
     * @return
     */

    @RequestMapping("/add")
    public String add(
            Model model,
            @RequestParam(value = "pid", required = false, defaultValue = "0") int pid,
            @RequestParam(value = "typeid", required = false, defaultValue = "0") int typeid
    ) {
        model.addAttribute("typeid", typeid);

        if (2 == typeid) {
            return "/doc/api/tagadd";
        }
        if (0 != pid) {
            model.addAttribute("pid", pid);
            return "/doc/api/docapiadd";
        } else {
            return "/doc/api/docadd";
        }
    }

    /**
     * 修改或新增API
     *
     * @return
     */

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(
            @ModelAttribute DocEntity doc,
            HttpServletRequest request,
            Model model,
            @RequestParam(value = "pid", required = false, defaultValue = "0") int pid
    ) {
        int typeid = doc.getTypeid();
//        if (0 != pid) {
//            model.addAttribute("referer", CommonConstants.ADMIN_SERVER + "/doc/api/list?pid=" + pid + "&typeid=" + typeid);
//        } else {
//            model.addAttribute("referer", CommonConstants.ADMIN_SERVER + "/doc/api/list?typeid=" + typeid);
//        }

       // CacheUser user = CacheUtil.getCacheUser();
        //Admin admin = user.getAdmin();
        if (doc.getId() == null) {
           // doc.setCreatedby(admin.getAdminName());
            docService.save(doc);
            model.addAttribute("msg", "新增成功");
        } else {
            DocEntity findDoc = docService.getDocById(doc.getId());
            if (null == findDoc) {
                log.warn("未找到，Id=" + doc.getId());
            } else {
              //  doc.setUpdateby(admin.getAdminName());
                docService.update(doc);
                model.addAttribute("msg", "修改成功");
            }
        }
        return Constants.MSG_URL;
    }

    /**
     * 删除API文档
     *
     * @param ids
     * @param model
     * @return
     */

    @RequestMapping(value = "/delDoc")
    public String deleteDoc(
            @RequestParam(value = "ids") String ids,
            Model model,
            HttpServletRequest request
    ) {

        String referer = request.getHeader("Referer");
        model.addAttribute("referer", referer);
        if (StringUtils.isBlank(ids)) {
            model.addAttribute("result", "ID为空");
            model.addAttribute("msg", "删除失败，ID为空");
        } else {
            String[] idArray = StringUtils.split(ids, ",");
            for (String idStr : idArray) {
                docService.delete(Integer.parseInt(idStr));
            }
            model.addAttribute("msg", "删除成功");
        }
        return Constants.MSG_URL;
    }

    /**
     * 根据id获取API文档
     *
     * @param model
     * @param id
     * @return
     */

    @RequestMapping(value = "/findById")
    public String findByid(
            Model model,
            @RequestParam(required = false, value = "id", defaultValue = "") int id,
            @RequestParam(value = "pid", required = false, defaultValue = "0") int pid,
            @RequestParam(value = "typeid", required = false, defaultValue = "0") int typeid
    ) {
        DocEntity doc = docService.getDocById(id);
        model.addAttribute("doc", doc);
        model.addAttribute("typeid", typeid);
        if (2 == typeid) {
            return "/doc/api/tagedit";
        }
        if (0 != pid) {
            model.addAttribute("pid", pid);
            return "/doc/api/docapiedit";
        } else {
            return "/doc/api/docedit";
        }
    }
}
