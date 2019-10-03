package bll.attendance;

import kesun.entity.KesunReturn;

import java.util.Map;

/**
 * @Author: 刘轩宇
 * @Date: 2019/6/20 15:39
 * @Version 3.2
 */
public interface IContactService {

    public KesunReturn findcon(Map<String,Object> map);

    public KesunReturn findbyId(String id);

    public int editcon(Map<String,Object> map);


}
