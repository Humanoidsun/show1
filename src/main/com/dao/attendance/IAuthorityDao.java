package dao.attendance;

import dao.IDoData;
import entity.Authority;

import java.util.List;
import java.util.Map;

public interface IAuthorityDao extends IDoData {
    public List<Authority> findAuthority(Map<String,Object> map);
    public Object findAuthorityById(Object obj);
}
