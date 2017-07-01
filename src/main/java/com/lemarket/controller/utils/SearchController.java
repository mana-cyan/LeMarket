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
        model.addAttribute("type", searchType);
        if(searchType == 0) {   //搜索商品
            List<Commodity> commodityList = searchCommodity(input, model);
            model.addAttribute("list", commodityList);
        }
        else {    //搜索店铺
            List<Shop> shopList = searchShop(input, model);
            model.addAttribute("list",shopList);
        }
        return "";
    }

    private List<Commodity> searchCommodity(String input, Model model)throws Exception {

        List<String> wordList = WordSegmentation.getWord(input);
        Map<Integer,Integer> keyNum = new HashMap<Integer, Integer>();
        for(int i=0; i<wordList.size(); i++) {
            String word = "%" + wordList.get(i) + "%";
            List<Commodity> Commoditys = commoditySearch.CommoditySearchName(word);
            for(int j=0; j<Commoditys.size(); j++) {
                Integer CommodityId = Commoditys.get(j).getId();
                if(keyNum.containsKey(CommodityId)){
                    int curNum = keyNum.get(CommodityId);
                    curNum++;
                    keyNum.put(CommodityId, curNum);
                }
                else keyNum.put(CommodityId, 1);
            }
        }

        //降序排序
        List<Map.Entry<Integer, Integer>> list = new ArrayList<Map.Entry<Integer, Integer>>(keyNum.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<Integer, Integer>>() {

            @Override
            public int compare(Entry<Integer, Integer> o1, Entry<Integer, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });

        List<Commodity> result = new ArrayList<Commodity>();
        for (Map.Entry<Integer, Integer> mapping : list) {
            Commodity cur = commoditySearch.CommoditySearchId(mapping.getKey());
            result.add(cur);
        }
        return result;
    }

    private List<Shop> searchShop(String input, Model model)throws Exception {

        List<String> wordList = WordSegmentation.getWord(input);
        Map<Integer,Integer> keyNum = new HashMap<Integer, Integer>();
        for(int i=0; i<wordList.size(); i++) {
            String word = "%" + wordList.get(i) + "%";
            List<Shop> Shops = shopSearch.ShopSearchName(word);
            for(int j=0; j<Shops.size(); j++) {
                Integer ShopIds = Shops.get(j).getId();
                if(keyNum.containsKey(ShopIds)){
                    int curNum = keyNum.get(ShopIds);
                    curNum++;
                    keyNum.put(ShopIds, curNum);
                }
                else keyNum.put(ShopIds, 1);
            }
        }

        //降序排序
        List<Map.Entry<Integer, Integer>> list = new ArrayList<Map.Entry<Integer, Integer>>(keyNum.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<Integer, Integer>>() {

            @Override
            public int compare(Entry<Integer, Integer> o1, Entry<Integer, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });

        List<Shop> result = new ArrayList<Shop>();
        for (Map.Entry<Integer, Integer> mapping : list) {
            Shop cur = shopSearch.ShopSearchId(mapping.getKey());
            result.add(cur);
        }
        return result;
    }

}
