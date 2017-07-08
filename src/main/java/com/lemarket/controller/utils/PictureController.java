package com.lemarket.controller.utils;

import com.lemarket.data.dao.CommodityMapper;
import com.lemarket.data.dao.PictureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PictureController {

    private final PictureMapper pictureMapper;
    private final CommodityMapper commodityMapper;

    @Autowired
    public PictureController(PictureMapper pictureMapper, CommodityMapper commodityMapper) {
        this.pictureMapper = pictureMapper;
        this.commodityMapper = commodityMapper;
    }

    @RequestMapping(value = "/image")
    @ResponseBody
    public String loadPicture(@RequestParam int id) {
        return pictureMapper.selectById(id).getPath();
    }

    @RequestMapping(value="/image/commodity")
    @ResponseBody
    public String loadPictureByCommodityId(int id)
    {
        int pictureId=commodityMapper.selectById(id).getImage();
        return pictureMapper.selectById(pictureId).getPath();
    }

}
