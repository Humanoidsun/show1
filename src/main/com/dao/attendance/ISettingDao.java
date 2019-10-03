package dao.attendance;

import dao.IDoData;

public interface ISettingDao extends IDoData {
    public Object selectByUserId(String userid);
}
