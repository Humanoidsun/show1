package dao.attendance;

import dao.IDoData;
import entity.Department;

public interface IDepartmentDao extends IDoData {
    public Department selectByPrimaryKey(Object name);
    public int deleteByPrimaryKey(Object id);
    public int updateByPrimaryKey(Object id);
}
