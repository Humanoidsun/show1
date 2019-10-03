package entity;

import kesun.entity.AbsBusinessObject;

public class Contact extends AbsBusinessObject {
    private String id;

    private String userid;

    private String contactid;

    private String remark;

    private String contactemail;

    private String contactphone;

    private String contactname;

    private String contactsex;

    private String contactdepartmentname;

    public String getContactemail() {
        return contactemail;
    }

    public void setContactemail(String contactemail) {
        this.contactemail = contactemail;
    }

    public String getContactphone() {
        return contactphone;
    }

    public void setContactphone(String contactphone) {
        this.contactphone = contactphone;
    }

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname;
    }

    public String getContactsex() {
        return contactsex;
    }

    public void setContactsex(String contactsex) {
        this.contactsex = contactsex;
    }

    public String getContactdepartmentname() {
        return contactdepartmentname;
    }

    public void setContactdepartmentname(String contactdepartmentname) {
        this.contactdepartmentname = contactdepartmentname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getContactid() {
        return contactid;
    }

    public void setContactid(String contactid) {
        this.contactid = contactid == null ? null : contactid.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}