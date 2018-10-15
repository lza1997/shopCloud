package com.lza.shopadmin.service;



import com.lza.shopadmin.entity.DocEnRefEntity;
import com.lza.shopadmin.utils.Pager;

import java.util.List;
import java.util.Map;

/**
 *    
 * 项目名称：shop-admin   
 * 类名称：DocEntityRefService   
 * 类描述：文档实体关联管理
 * 创建人：lza  
 * 创建时间：2018年5月05日 02:00:00
 */
public interface DocEntityRefService {
	
	/**
	 * 获取关联总数
	 * @param
	 * @return
	 */
	int getRefTotal(DocEnRefEntity ref);
	
	/**
	 * 获取关联的分页列表
	 * @param pager
	 * @return
	 */
	List<Map<String, String>> getRefList(Pager pager);
	
	/**
	 * 删除关联的数据
	 * @param id
	 */
	void delete(int id);
	
	/**
	 * 保存关联数据
	 * @param ref
	 */
	void save(DocEnRefEntity ref);
	
	/**
	 * 根据文档id获取关联的所有列表
	 * @param
	 * @return
	 */
	List<Map<String, String>> getAllRefList(int docid);
}
