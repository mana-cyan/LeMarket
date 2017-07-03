package com.lemarket.controller.utils;

import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.Shop;
import com.lemarket.service.utils.CommoditySearch;
import com.lemarket.service.utils.ShopSearch;
import com.lemarket.service.utils.WordSegmentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.*;
import java.util.Map.Entry;

@Controller
public class SearchController {

    private final CommoditySearch commoditySearch;

    private final ShopSearch shopSearch;

    @Autowired
    public SearchController(CommoditySearch commoditySearch, ShopSearch shopSearch) {
        this.commoditySearch = commoditySearch;
        this.shopSearch = shopSearch;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(int searchType, String input, Model model)throws Exception {
        System.out.println(searchType);
        System.out.println(input);
        model.addAttribute("type", searchType);
        if(searchType == 0) {   //搜索商品
            List<Commodity> commodityList = searchCommodity(input);
            model.addAttribute("list", commodityList);
        }
        else {    //搜索店铺
            List<Shop> shopList = searchShop(input);
            model.addAttribute("list",shopList);
        }
        return "shop/search";
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
            Commodity cur = commoditySearch.commoditySearchId(mapping.getKey());
            result.add(cur);
        }
        return result;
    }

    private List<Shop> searchShop(String input)throws Exception {

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

        List<Shop> result = new ArrayList<>();
        for (Map.Entry<Integer, Integer> mapping : list) {
            Shop cur = shopSearch.shopSearchId(mapping.getKey());
            result.add(cur);
        }
        return result;
    }

}
