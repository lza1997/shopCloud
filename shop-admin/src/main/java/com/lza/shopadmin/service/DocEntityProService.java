package com.lza.shopadmin.service;



import com.lza.shopadmin.entity.DocEnProEntity;
import com.lza.shopadmin.utils.Pager;

import java.util.List;

/**
 *    
 * 项目名称：shop-admin   
 * 类名称：DocEntityProService   
 * 类描述：文档实体属性管理
 * 创建人：lza  
 * 创建时间：2018年5月04日 02:00:00
 */
public interface DocEntityProService {
	
	/**
	 * 获取属性的总数
	 * @param
	 * @return
	 */
	int getProTotal(DocEnProEntity pro);
	
	/**
	 * 获取属性的分页数据
	 * @param pager
	 * @return
	 */
	List<DocEnProEntity> getProList(Pager pager);
	
	/**
	 * 根据id获取属性
	 * @param id
	 * @return
	 */
	DocEnProEntity getProById(int id);
	
	/**
	 * 保存属性
	 * @param pro
	 */
	void save(DocEnProEntity pro);
	
	/**
	 * 修改属性
	 * @param pro
	 */
	void update(DocEnProEntity pro);
	
	/**
	 * 删除属性
	 * @param
	 */
	void delete(int id);
	
	/**
	 * 根据实体id获取参数列表
	 * @param entityid
	 * @return
	 */
	List<DocEnProEntity> getAllProList(int entityid);
}
