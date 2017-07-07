package com.lemarket.controller.market;

import com.lemarket.data.reponseObject.CategoryJson;
import com.lemarket.service.market.CategoryDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CategoryController {

    private final CategoryDetails categoryDetails;

    @Autowired
    public CategoryController(CategoryDetails categoryDetails) {
        this.categoryDetails = categoryDetails;
    }

    /**
     * 获取顶级商品分类json对象
     * @return 格式化json对象
     */
    @RequestMapping(value = "/category", method = RequestMethod.GET)
    @ResponseBody
    public CategoryJson category(){
        return categoryDetails.getCateDetail();
    }

}
