package com.lza.shopadmin.service.Impl;


import com.lza.shopadmin.dao.DocReturnValueDao;
import com.lza.shopadmin.entity.DocReturnValueEntity;
import com.lza.shopadmin.service.DocReturnValueService;
import com.lza.shopadmin.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *    
 * 项目名称：shop-admin   
 * 类名称：DocReturnValueDaoImpl
 * 类描述：API文档返回值管理
 * 创建人：lza 
 * 创建时间：2018年5月08日 10:00:00
 */
@Service("docReturnValueServiceImpl")
public class DocReturnValueServiceImpl implements DocReturnValueService {

	@Autowired
	private DocReturnValueDao docReturnValueDaoImpl;
	
	/**
	 * 获取返回值总条数
	 * @param
	 * @return
	 */
	public int getReturnValueTotal(DocReturnValueEntity returnValue) {
		return docReturnValueDaoImpl.getReturnValueTotal(returnValue);
	}

	/**
	 * 获取返回值分页数据
	 * @param pager
	 * @return
	 */
	public List<DocReturnValueEntity> getReturnValueList(Pager pager) {
		return docReturnValueDaoImpl.getReturnValueList(pager);
	}

	/**
	 * 保存返回值数据
	 * @param returnValue
	 */
	public void save(DocReturnValueEntity returnValue) {
		returnValue.setCreateTime(System.currentTimeMillis());
		docReturnValueDaoImpl.save(returnValue);
	}

	/**
	 * 根据id删除返回值数据
	 * @param id
	 */
	public void delete(int id) {
		docReturnValueDaoImpl.delete(id);
	}

	/**
	 * 修改返回值数据
	 * @param returnValue
	 */
	public void update(DocReturnValueEntity returnValue) {
		returnValue.setUpdateTime(System.currentTimeMillis());
		docReturnValueDaoImpl.update(returnValue);
	}

	/**
	 * 根据id获取返回值数据
	 * @param id
	 * @return
	 */
	public DocReturnValueEntity getReturnValueById(int id) {
		return docReturnValueDaoImpl.getReturnValueById(id);
	}

	/**
	 * 根据文档id获取返回值信息
	 * @param docid
	 * @return
	 */
	public DocReturnValueEntity getReturnValueByDocId(int docid) {
		return docReturnValueDaoImpl.getReturnValueByDocId(docid);
	}

	/**
	 * 根据docid获取返回值列表
	 * @param docId
	 * @return
	 */
	public List<DocReturnValueEntity> getReturnValueListByDocId(int docId) {
		return docReturnValueDaoImpl.getReturnValueListByDocId(docId);
	}
	
	

}
