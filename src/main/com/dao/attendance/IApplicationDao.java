package dao.attendance;

import dao.IDoData;
import entity.Application;

import java.util.List;
import java.util.Map;

/**
 * @Author: 刘轩宇
 * @Date: 2019/6/20 15:01
 * @Version 3.2
 */
public interface IApplicationDao extends IDoData {
    public List<Object> findapp(Map<String,Object> map);
    public Object findbyid(String id);
    public int editapp(Map<String,Object> map);
    public int submitApplication(Map<String,Object> map);
    public List<Object> applicationSubmitFind(Map<String,Object> map);
}
