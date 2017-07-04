package com.lemarket.data.reponseObject;

public class UsernameCheckStatus {
    private String status;
    private String salt;

    public UsernameCheckStatus() {
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
