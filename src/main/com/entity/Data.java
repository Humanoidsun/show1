package entity;

import com.sun.xml.bind.v2.model.core.ID;
import dao.IDoData;
import kesun.entity.AbsSuperObject;

public class Data extends AbsSuperObject {

    private String status;
    private int number;

    @Override
    public String getStatus() {
        return status;
    }

    @Override
    public void setStatus(String status) {
        this.status = status;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Data{" +
                "status='" + status + '\'' +
                ", number=" + number +
                '}';
    }
}
