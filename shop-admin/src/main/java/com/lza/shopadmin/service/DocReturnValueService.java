package com.lza.shopadmin.service;



import com.lza.shopadmin.entity.DocReturnValueEntity;
import com.lza.shopadmin.utils.Pager;

import java.util.List;

/**
 *    
 * 项目名称：shop-admin   
 * 类名称：DocReturnValueService
 * 类描述：API文档返回值管理
 * 创建人：lza  
 * 创建时间：2018年5月08日 10:00:00
 */
public interface DocReturnValueService {
	
	/**
	 * 获取返回值总条数
	 * @param
	 * @return
	 */
	int getReturnValueTotal(DocReturnValueEntity returnValue);
	
	/**
	 * 获取返回值分页数据
	 * @param pager
	 * @return
	 */
	List<DocReturnValueEntity> getReturnValueList(Pager pager);
	
	/**
	 * 保存返回值数据
	 * @param returnValue
	 */
	void save(DocReturnValueEntity returnValue);
	
	/**
	 * 根据id删除返回值数据
	 * @param id
	 */
	void delete(int id);
	
	/**
	 * 修改返回值数据
	 * @param returnValue
	 */
	void update(DocReturnValueEntity returnValue);
	
	/**
	 * 根据id获取返回值数据
	 * @param id
	 * @return
	 */
	DocReturnValueEntity getReturnValueById(int id);
	
	/**
	 * 根据文档id获取返回值信息
	 * @param docid
	 * @return
	 */
	DocReturnValueEntity getReturnValueByDocId(int docid);
	
	/**
	 * 根据docid获取返回值列表
	 * @param docId
	 * @return
	 */
	List<DocReturnValueEntity> getReturnValueListByDocId(int docId);

}
