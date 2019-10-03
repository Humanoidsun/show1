package bll.attendance;

import kesun.entity.KesunReturn;

import java.util.List;
import java.util.Map;

/**
 * @Author: 刘轩宇
 * @Date: 2019/6/20 15:37
 * @Version 3.2
 */
public interface IApplication {
    public KesunReturn findapp(Map<String,Object> map);

    public KesunReturn findbyid(String id);

    public int editapp(Map<String,Object> map);

    public int submitApplication(Map<String,Object> map);

    public List<Object> applicationSubmitFind(Map<String,Object> map);


}
