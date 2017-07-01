package com.lemarket.data.reponseObject;

import java.util.Map;

public class CategoryJson {
    private Map<String, CategoryDetail> category;

    public CategoryJson(Map<String, CategoryDetail> category) {
        this.category = category;
    }

    public Map<String, CategoryDetail> getCategory() {
        return category;
    }

    public void setCategory(Map<String, CategoryDetail> category) {
        this.category = category;
    }
}
