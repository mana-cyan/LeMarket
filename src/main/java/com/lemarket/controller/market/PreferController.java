package com.lemarket.controller.market;

import com.lemarket.data.model.Commodity;
import com.lemarket.service.market.PreferList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PreferController {

    private final PreferList preferList;

    @Autowired
    public PreferController(PreferList preferList) {
        this.preferList = preferList;
    }

    @RequestMapping(value = "/prefer", method = RequestMethod.GET)
    @ResponseBody
    public List<Commodity> prefer(){
        return preferList.getPreferListObject();
    }
}