package com.lemarket.controller.utils;

import com.lemarket.data.dao.PictureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PictureController {

    private final PictureMapper pictureMapper;

    @Autowired
    public PictureController(PictureMapper pictureMapper) {
        this.pictureMapper = pictureMapper;
    }

    @RequestMapping(value = "/image")
    @ResponseBody
    public String loadPicture(@RequestParam int id) {
        return pictureMapper.selectById(id).getPath();
    }

}
