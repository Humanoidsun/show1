package bll.attendance;

import entity.Department;

public interface IDepartmentService {
    public Department selectbyid(Object obj);
    public int Delete(Object obj);
    public int Update(Object obj);
}
