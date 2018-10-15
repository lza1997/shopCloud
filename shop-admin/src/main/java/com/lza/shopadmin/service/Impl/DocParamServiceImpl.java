package com.lza.shopadmin.service.Impl;


import com.lza.shopadmin.dao.DocParamDao;
import com.lza.shopadmin.entity.DocParamEntity;
import com.lza.shopadmin.service.DocParamService;
import com.lza.shopadmin.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *    
 * 项目名称：shop-admin   
 * 类名称：DocParamServiceImpl   
 * 类描述：API文档参数管理
 * 创建人：lza   
 * 创建时间：2018年5月07日 02:00:00
 */
@Service("docParamServiceImpl")
public class DocParamServiceImpl implements DocParamService {

	@Autowired
	private DocParamDao docParamDaoImpl;
	
	/**
	 * 获取参数的总条数
	 * @param pager
	 * @return
	 */
	public int getParamTotal(DocParamEntity param) {
		return docParamDaoImpl.getParamTotal(param);
	}

	/**
	 * 获取参数的分页数据
	 * @param pager
	 * @return
	 */
	public List<DocParamEntity> getParamList(Pager pager) {
		return docParamDaoImpl.getParamList(pager);
	}

	/**
	 * 保存参数
	 * @param param
	 */
	public void save(DocParamEntity param) {
		param.setCreateTime(System.currentTimeMillis());
		docParamDaoImpl.save(param);
	}

	/**
	 * 更新参数
	 * @param param
	 */
	public void update(DocParamEntity param) {
		param.setUpdateTime(System.currentTimeMillis());
		docParamDaoImpl.update(param);
	}

	/**
	 * 根据id删除参数
	 * @param id
	 */
	public void delete(int id) {
		docParamDaoImpl.delete(id);
	}

	/**
	 * 根据id获取参数
	 * @param id
	 * @return
	 */
	public DocParamEntity getParamById(int id) {
		return docParamDaoImpl.getParamById(id);
	}

	/**
	 * 根据docid获取所有参数
	 * @param docid
	 * @return
	 */
	public List<DocParamEntity> getAllParamList(int docid) {
		return docParamDaoImpl.getAllParamList(docid);
	}
	
	

}
