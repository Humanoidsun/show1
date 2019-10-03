package dao.attendance;

import dao.IDoData;
import entity.User;

public interface IUserManagerDao extends IDoData {
    public int dddd(Object id);
    public int updateByPrimaryKey(Object user);
    public User selectbyid(Object id);
}