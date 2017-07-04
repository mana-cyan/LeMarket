package com.lemarket.data.reponseObject;

/**
 * Created by wk on 2017/6/27.
 */
public class EmailCheckStatus {
    private String status;
    private String salt;

    public EmailCheckStatus() {
        status = "";
        salt = "";
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
