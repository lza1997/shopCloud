package com.lza.shopadmin.service;



import com.lza.shopadmin.entity.DocEntity;
import com.lza.shopadmin.utils.Pager;

import java.util.List;

/**
 * 项目名称：shop-admin
 * 类名称：DocService
 * 类描述：接口
 * 创建人：lza
 * 创建时间：2016年4月22日 10:52:19
 */
public interface DocService {

	/**
	 * 获取文档总数
	 * @param
	 * @return
	 */
	int getDocCount(DocEntity docEntity);
	
	/**
	 * 获取文档分页列表
	 * @param pager
	 * @return
	 */
	List<DocEntity> getDocList(Pager pager);
	
	/**
	 * 根据id获取文档详细
	 * @param id
	 * @return
	 */
	DocEntity getDocById(int id);
	
	/**
	 * 添加文档数据
	 * @param doc
	 */
	void save(DocEntity doc);
	
	/**
	 * 更新文档数据
	 * @param doc
	 */
	void update(DocEntity doc);
	
	/**
	 * 删除文档数据
	 * @param
	 */
	void delete(int id);
	
	/**
	 * 获取所有的文档
	 * @return
	 */
	List<DocEntity> getAllDocList(DocEntity doc);
}
