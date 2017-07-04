package com.lemarket.data.reponseObject;

public class CategoryDetail {
    private int id;
    private int pictureId;

    public CategoryDetail() {
    }

    public CategoryDetail(int id, int pictureId) {
        this.id = id;
        this.pictureId = pictureId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPictureId() {
        return pictureId;
    }

    public void setPictureId(int pictureId) {
        this.pictureId = pictureId;
    }

}
