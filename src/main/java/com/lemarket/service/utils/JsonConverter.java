package com.lemarket.service.utils;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lemarket.data.model.Commodity;
import com.lemarket.data.model.OrderWithDetail;
import com.lemarket.data.model.Orderdetails;
import com.lemarket.data.model.Shop;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gxw on 2017/7/8.
 */
@Service
public class JsonConverter {
    public String commodityListToJSON(List<Commodity> commodities)
    {
        JsonArray jsonArray=new JsonArray();
        for(Commodity commodity: commodities)
        {
            JsonObject jsonObject=new JsonObject();
            jsonObject.addProperty("image",commodity.getImage());
            jsonObject.addProperty("name",commodity.getName());
            jsonObject.addProperty("price",commodity.getPrice());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    public String shopListToJSON(List<Shop> shopList)
    {
        JsonArray jsonArray=new JsonArray();
        for(Shop shop:shopList)
        {
            JsonObject jsonObject=new JsonObject();
            jsonObject.addProperty("id",shop.getId());
            jsonObject.addProperty("name",shop.getName());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    public String OrdeDetailToJSON(List<OrderWithDetail> orderWithDetails)
    {
        JsonArray jsonArray=new JsonArray();
        for(OrderWithDetail orderWithDetail:orderWithDetails)
        {
            JsonObject jsonObject=new JsonObject();
            jsonObject.addProperty("id",orderWithDetail.getId());
            jsonObject.addProperty("commodityName",orderWithDetail.getName());
            jsonObject.addProperty("type",orderWithDetail.getCommodityType());
            jsonObject.addProperty("address",orderWithDetail.getAddress());
            jsonObject.addProperty("commodityId",orderWithDetail.getCommodityId());
            jsonObject.addProperty("price",orderWithDetail.getPrice());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }
}
