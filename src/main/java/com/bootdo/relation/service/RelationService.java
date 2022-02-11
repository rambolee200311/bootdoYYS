package com.bootdo.relation.service;
import java.util.List;
import java.util.Map;
import com.bootdo.relation.domain.RelationDO;
public interface RelationService {
    RelationDO get(Long id);
    RelationDO getParent(Long id);
    List<RelationDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(RelationDO employee);

    int update(RelationDO employee);

    int remove(Long id);

    int batchRemove(Long[] ids);
}
