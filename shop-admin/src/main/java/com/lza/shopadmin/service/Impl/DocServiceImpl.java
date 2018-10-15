package com.lza.shopadmin.service.Impl;


import com.lza.shopadmin.dao.DocDao;
import com.lza.shopadmin.entity.DocEntity;
import com.lza.shopadmin.service.DocService;
import com.lza.shopadmin.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 项目名称：shop-admin
 * 类名称：DocServiceImpl
 * 类描述：DocService实现类
 * 创建人：lza
 * 创建时间：2018年4月22日 10:52:19
 */
@Service("docService")
public class DocServiceImpl implements DocService {

	@Autowired
	private DocDao docDao;
	/**
	 * 获取文档总数
	 * @param pager
	 * @return
	 */
	@Override
	public List<DocEntity> getDocList(Pager pager) {
		return docDao.getDocList(pager);
	}

	/**
	 * 获取文档分页列表
	 * @param
	 * @return
	 */
	@Override
	public DocEntity getDocById(int id) {
		return docDao.getDocById(id);
	}

	/**
	 * 根据id获取文档详细
	 * @param
	 * @return
	 */
	@Override
	public int getDocCount(DocEntity docEntity) {
		return docDao.getDocCount(docEntity);
	}

	/**
	 * 添加文档数据
	 * @param doc
	 */
	@Override
	public void save(DocEntity doc) {
		doc.setCreateTime(System.currentTimeMillis());
		docDao.save(doc);
	}

	/**
	 * 更新文档数据
	 * @param doc
	 */
	@Override
	public void update(DocEntity doc) {
		doc.setUpdateTime(System.currentTimeMillis());
		docDao.update(doc);
	}

	/**
	 * 删除文档数据
	 * @param
	 */
	@Override
	public void delete(int id) {
		docDao.delete(id);
	}
	
	/**
	 * 获取所有的文档
	 * @return
	 */
	public List<DocEntity> getAllDocList(DocEntity doc){
		return docDao.getAllDocList(doc);
	}
	
}