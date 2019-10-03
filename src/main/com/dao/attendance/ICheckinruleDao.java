package dao.attendance;

import dao.IDoData;

import java.util.Map;

public interface ICheckinruleDao extends IDoData {
    public Object findCheckinrule();
    public int updateCheckinrule(Map<String,Object> map);
}
