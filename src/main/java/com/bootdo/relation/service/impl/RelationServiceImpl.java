package com.bootdo.relation.service.impl;

import com.bootdo.relation.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import com.bootdo.relation.dao.RelationDao;
import com.bootdo.relation.domain.RelationDO;

@Service

public class RelationServiceImpl implements RelationService {
    @Autowired
    private RelationDao relationDao;

    @Override
    public RelationDO get(Long id){
        return relationDao.get(id);
    }

    @Override
    public RelationDO getParent(Long id){
        return relationDao.getParent(id);
    }

    @Override
    public List<RelationDO> list(Map<String, Object> map){
        return relationDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map){
        return relationDao.count(map);
    }

    @Override
    public int save(RelationDO employee){
        return relationDao.save(employee);
    }

    @Override
    public int update(RelationDO employee){
        return relationDao.update(employee);
    }

    @Override
    public int remove(Long id){
        return relationDao.remove(id);
    }

    @Override
    public int batchRemove(Long[] ids){
        return relationDao.batchRemove(ids);
    }
}
