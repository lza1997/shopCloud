package com.lza.shopadmin.service;


import com.lza.shopadmin.entity.DocEnEntity;
import com.lza.shopadmin.utils.Pager;

import java.util.List;

/**
 *    
 * 项目名称：shop-admin   
 * 类名称：DocEntityService   
 * 类描述：文档实体管理
 * 创建人：lza   
 * 创建时间：2018年5月04日 10:52:19
 */
public interface DocEntityService {
	
	/**
	 * 获取引用实体总数
	 * @param
	 * @return
	 */
	int getDocEntityTotal(DocEnEntity docEntity);
	
	/**
	 * 获取引用实体分页数据
	 * @param pager
	 * @return
	 */
	List<DocEnEntity> getDocEntityList(Pager pager);
	
	/**
	 * 根据id获取引用实体
	 * @param entityId
	 * @return
	 */
	DocEnEntity getDocEntityById(int entityId);
	
	/**
	 * 保存引用实体
	 * @param docEntity
	 */
	void saveDocEntity(DocEnEntity docEntity);
	
	/**
	 * 修改引用实体
	 * @param docEntity
	 */
	void updateDocEntity(DocEnEntity docEntity);
	
	/**
	 *根据id删除引用实体
	 * @param entityId
	 */
	void deleteDocEntity(int entityId);
	
	/**
	 * 获取所有的实体
	 * @return
	 */
	List<DocEnEntity> getAllDocEntityList();
	
	/**
	 * 根据名字获取引用实体
	 * @param entityName
	 * @return
	 */
	DocEnEntity getDocEntityByName(String entityName);
}
