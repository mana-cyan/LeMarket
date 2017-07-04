package com.lemarket.service.market;

import com.lemarket.data.dao.CategoryMapper;
import com.lemarket.data.model.Category;
import com.lemarket.data.reponseObject.CategoryDetail;
import com.lemarket.data.reponseObject.CategoryJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryDetails {

    private final CategoryMapper categoryMapper;

    @Autowired
    public CategoryDetails(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }

    //封装商品主分类json对象
    public CategoryJson getCateDetail(){
        List<Category> categoryList = categoryMapper.selectAll();
        Map<String, CategoryDetail> stringCateDetailMap = new LinkedHashMap<>();
        for (Category category: categoryList){
            if(category.getParent() == null){
                String name = category.getName();
                int id = category.getId();
                int pictureid = category.getPicture();
                stringCateDetailMap.put(name, new CategoryDetail(id, pictureid));
            }
        }
        return new CategoryJson(stringCateDetailMap);
    }

}
