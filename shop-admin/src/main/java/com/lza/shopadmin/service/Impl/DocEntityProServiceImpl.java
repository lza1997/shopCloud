package com.lza.shopadmin.service.Impl;


import com.lza.shopadmin.dao.DocEntityProDao;
import com.lza.shopadmin.entity.DocEnProEntity;
import com.lza.shopadmin.service.DocEntityProService;
import com.lza.shopadmin.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *    
 * 项目名称：shop-admin   
 * 类名称：DocEntityProServiceImpl   
 * 类描述：文档实体属性管理
 * 创建人：lza  
 * 创建时间：2018年5月04日 02:00:00
 */
@Service("docEntityProService")
public class DocEntityProServiceImpl implements DocEntityProService {

	@Autowired
	private DocEntityProDao docEntityProDao;
	/**
	 * 获取属性的总数
	 * @param
	 * @return
	 */
	public int getProTotal(DocEnProEntity pro) {
		return docEntityProDao.getProTotal(pro);
	}

	/**
	 * 获取属性的分页数据
	 * @param pager
	 * @return
	 */
	public List<DocEnProEntity> getProList(Pager pager) {
		return docEntityProDao.getProList(pager);
	}

	/**
	 * 根据id获取属性
	 * @param id
	 * @return
	 */
	public DocEnProEntity getProById(int id) {
		return docEntityProDao.getProById(id);
	}

	/**
	 * 保存属性
	 * @param pro
	 */
	public void save(DocEnProEntity pro) {
		pro.setCreateTime(System.currentTimeMillis());
		docEntityProDao.save(pro);
	}

	/**
	 * 修改属性
	 * @param pro
	 */
	public void update(DocEnProEntity pro) {
		pro.setUpdateTime(System.currentTimeMillis());
		docEntityProDao.update(pro);
	}

	/**
	 * 删除属性
	 * @param
	 */
	public void delete(int id) {
		docEntityProDao.delete(id);
	}

	/**
	 * 根据实体id获取参数列表
	 * @param entityid
	 * @return
	 */
	public List<DocEnProEntity> getAllProList(int entityid) {
		return docEntityProDao.getAllProList(entityid);
	}
	
	
	
}
