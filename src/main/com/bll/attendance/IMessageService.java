package bll.attendance;

import entity.Message;

import java.util.List;
import java.util.Map;

public interface IMessageService {
    Message selectbyid(String id);

    int Delete(String id);

    int Update(Message message);

    public List<Object> findByCondition(Map<String,Object> map);
}
