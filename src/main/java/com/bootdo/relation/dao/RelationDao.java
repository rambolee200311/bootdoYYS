package com.bootdo.relation.dao;
import org.apache.ibatis.annotations.Mapper;
import com.bootdo.relation.domain.RelationDO;
import java.util.List;
import java.util.Map;
/**
 * 家属档案
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-10 15:16:36
 */
@Mapper
public interface RelationDao {
    RelationDO get(Long id);
    RelationDO getParent(Long id);

    List<RelationDO> list(Map<String,Object> map);

    int count(Map<String,Object> map);

    int save(RelationDO employee);

    int update(RelationDO employee);

    int remove(Long id);

    int batchRemove(Long[] ids);
}
