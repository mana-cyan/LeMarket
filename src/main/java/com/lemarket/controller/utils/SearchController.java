package com.lemarket.controller.utils;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Shop;
import com.lemarket.data.model.ShopWithUser;
import com.lemarket.service.utils.CommoditySearch;
import com.lemarket.service.utils.JsonConverter;
import com.lemarket.service.utils.ShopSearch;
import com.lemarket.service.utils.WordSegmentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.Map.Entry;

@Controller
public class SearchController {

    private final CommoditySearch commoditySearch;

    private final ShopSearch shopSearch;

    private final JsonConverter jsonConverter;

    @Autowired
    public SearchController(CommoditySearch commoditySearch, ShopSearch shopSearch, JsonConverter jsonConverter) {
        this.commoditySearch = commoditySearch;
        this.shopSearch = shopSearch;
        this.jsonConverter = jsonConverter;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView search(Integer searchType, String input,Integer page, HttpServletRequest request)throws Exception {
        if(searchType==null) searchType=0;
        if(page==null) page=1;
        int pageSize=8;
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("shop/search");
        modelAndView.addObject("type",searchType);
        modelAndView.addObject("nowPage",page);
        if(searchType == 0) {   //搜索商品
            List<Commodity> commodityList = searchCommodity(input);
//            model.addAttribute("list", commodityList);
            modelAndView.addObject("data",jsonConverter.commodityListToJSON(commodityList));
            modelAndView.addObject("totalPage",(commodityList.size()-1)/pageSize+1);
        }
        else {    //搜索店铺
            List<ShopWithUser> shopList = searchShop(input);
//            model.addAttribute("list",shopList);
            modelAndView.addObject("totalPage",(shopList.size()-1)/pageSize+1);
        }
        return modelAndView;
    }



    private void updateKeyMap(Map<Integer, Integer> map, int id){
        if(map.containsKey(id)){
            int curNum = map.get(id);
            curNum++;
            map.put(id, curNum);
        }
        else map.put(id, 1);
    }

    private List<Commodity> searchCommodity(String input)throws Exception {
        List<String> wordList = WordSegmentation.getWord(input);
        Map<Integer,Integer> keyNum = new HashMap<>();
        for (String aWordList : wordList) {
            String word = "%" + aWordList + "%";
            List<Commodity> commodities = commoditySearch.commoditySearchName(word);
            for (Commodity commodity : commodities) {
                Integer commodityId = commodity.getId();
                updateKeyMap(keyNum, commodityId);
            }
        }

        //降序排序
        List<Map.Entry<Integer, Integer>> list = new ArrayList<>(keyNum.entrySet());
        list.sort((o1, o2) -> o2.getValue().compareTo(o1.getValue()));

        List<Commodity> result = new ArrayList<>();
        for (Map.Entry<Integer, Integer> mapping : list) {
            Commodity cur = commoditySearch.commoditySearchById(mapping.getKey());
            result.add(cur);
        }
        return result;
    }

    private List<ShopWithUser> searchShop(String input)throws Exception {

        List<String> wordList = WordSegmentation.getWord(input);
        Map<Integer,Integer> keyNum = new HashMap<>();
        for (String aWordList : wordList) {
            String word = "%" + aWordList + "%";
            List<Shop> Shops = shopSearch.shopSearchName(word);
            for (com.lemarket.data.model.Shop Shop : Shops) {
                Integer shopIds = Shop.getId();
                updateKeyMap(keyNum, shopIds);
            }
        }

        //降序排序
        List<Map.Entry<Integer, Integer>> list = new ArrayList<>(keyNum.entrySet());
        list.sort((o1, o2) -> o2.getValue().compareTo(o1.getValue()));

        List<ShopWithUser> result = new ArrayList<>();
        for (Map.Entry<Integer, Integer> mapping : list) {
            ShopWithUser cur = shopSearch.shopSearchId(mapping.getKey());
            result.add(cur);
        }
        return result;
    }

}
