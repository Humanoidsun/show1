package dao.attendance;

import dao.IDoData;
import entity.Message;

import java.util.List;
import java.util.Map;

public interface IMessageDao extends IDoData {
    public Message selectByPrimaryKey(Object id);
    public int deleteByPrimaryKey(Object id);
    public int updateByPrimaryKey(Object id);
    public List<Object> findByCondition(Map<String,Object> map);
}
