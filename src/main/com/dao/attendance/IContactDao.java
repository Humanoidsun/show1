package dao.attendance;

import dao.IDoData;
import entity.Contact;

import java.util.List;
import java.util.Map;

/**
 * @Author: 刘轩宇
 * @Date: 2019/6/20 15:00
 * @Version 3.2
 */
public interface IContactDao extends IDoData {
    public List<Object> findcon(Map<String,Object> map);
    public Object findbyId(String id);
    public int editcon(Map<String,Object> map);
}
