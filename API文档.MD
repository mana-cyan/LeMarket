LeMarket API文档
# Page:商城首页

1. 加载图片

|URL|Header|Method|
|---|------|------|
|loadPicture|无|GET|

**URL Params**
```
id:int
type:"shop"/"commodity"
```
**return data**
```
{
'path':string
}
```

2. 检测用户名

|URL|Header|Method|
|---|------|------|
|checkUsername|无|GET|

URL Param
```
username: string
```
**return data**
```
{
	'status': 'SUCCESS'/'ERROR',
	'salt': string
}
```

3. 检测邮箱

|URL|Header|Method|
|---|------|------|
|checkEmail|无|GET|

URL Param
```
email: string
```
**return data (json):**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

4. 获取盐值

|URL|Header|Method|
|---|------|------|
|getSalt|无|GET|

**Param Data**
```
无
```

**Returen Data**
```
{
	'salt': string
}
```

5. 用户注册

|URL|Header|Method|
|---|------|------|
|register|无|POST|

**Post Data**
```
email: string 邮箱 （检测）
username:string  用户名 （UNIQUE）
password:string  密码 （base64）
```

**Return Code**
```
{
	'token': string
} 
```

6. 用户登录(用户名）

|URL|Header|Method|
|---|------|------|
|login|id|GET|

**Param Data**
```
无
```

**Return Code**
```
{
	'token': string
} 
```

7. 用户登录(邮箱）

|URL|Header|Method|
|---|------|------|
|login|无|POST|

**Post Data**
```
email: string 邮箱 （检测）
password:string  密码 （base64）
```

**Return Code**
```
{
	'token': string
} 
```

8. 获取分类

|URL|Header|Method|
|---|------|------|
|category|无|GET|

**Post Data**
```
无
```

**Return Code**
```
{
	'category': {
		'cate1': ['subcate1', 'subcate2'],
		'cate2': ['subcate1', 'subcate2']
	}
} 
```

9. 默认推荐(10条）

|URL|Header|Method|
|---|------|------|
|prefer|无|GET|

**Post Data**
```
无
```

**Return Code**
```
{
	'commodities': [
		'commodity': {	
			'id': int,
			'name': string,
			'price': float,
			'saled': int,
			'visited': int,
			'comment': int
		}
	]
} 
```

10. 搜索

|URL|Header|Method|
|---|------|------|
|search|无|GET|

**Param Data**
```
type:'shop'/'commodity'
input: string
```

**Return Code**
> shop
```
{
	'id': int,
	'name': string,
	'owner': string,
	'description': string
} 
```

> commodity
```
{
	'id': int,
	'name': string,
	'price': float,
	'saled': int,
	'shop': string
}
```

# Page:商品详情

1. 获取详情

|URL|Header|Method|
|---|------|------|
|commodity|无|GET|

**Param Data**
```
id: int
```

**Return Code**
```
{
	'name': string,
	'price': string,
	'owner': string,
	'description': string
} 
```

2. 获取商品分类

|URL|Header|Method|
|---|------|------|
|commodityType|无|GET|

**Param Data**
```
id: int
```

**Return Code**
```
{
	'type':
	{
		'name': string
	}
} 
```

3. 加入购物车

|URL|Header|Method|
|---|------|------|
|want|token|GET|

**Param Data**
```
id: int (商品id)
type: int(商品型号id) 
count: int
```

**Return Code**
```
{
	'status': 'SUCCESS'/'ERROR'
} 
```

4. 获取评论(每次5条)

|URL|Header|Method|
|---|------|------|
|getComment|无|GET|

**Param Data**
```
id: int (商品id)
page: int
```

**Return Code**
```
{
	'comments': [
		'comment1': { 'name': string, 'content': string', 'date': date }
	]
} 
```

5. 相关推荐(5条）

|URL|Header|Method|
|---|------|------|
|prefer|无|GET|

**Post Data**
```
无
```

**Return Code**
```
{
	'commodities': [
		'commodity': {	
			'id': int,
			'name': string,
			'price': float,
			'saled': int,
			'visited': int,
			'comment': int
		}
	]
} 
```

# page:店铺页面

1. 店铺信息

|URL|Header|Method|
|---|------|------|
|shop|无|GET|

**Post Data**
```
id: int (店铺id)
```

**Return Code**
```
{
	'name': string,
	'owner': string,
	'description': string
} 
```

2. 获取商品

|URL|Header|Method|
|---|------|------|
|shopCommodity|无|GET|

**Param Data**
```
id: int (商品id)
page: int
```

**Return Code**
```
{
	'commodities': [
		'commodity': {	
			'id': int,
			'name': string,
			'price': float,
			'saled': int,
			'visited': int,
			'comment': int
		}
	]
} 
```

# page: 购买页面

1. 保存订单信息

|URL|Header|Method|
|---|------|------|
|pay|token|POST|

**Post Data**
```
name: string(收货人姓名),
address: string,
phoneNumber: string,
postCode: string(邮编),
id: int,
type: int,
count: int
```

**Return Code**
```
{
	'status': "SUCCESS"/"ERROR"
}
```

# page: 个人页面

1. 待付款订单

|URL|Header|Method|
|---|------|------|
|unpaid|token|GET|

**Param Data**
```
无
```

**Return Data**
```
{
	'unpaid': 
	{
		'commodity1': { 'id': int, 'name': string, 'price': float }
		'commodity2': { 'id': int, 'name': string, 'price': float }
	}
}
```

2. 待收货订单

|URL|Header|Method|
|---|------|------|
|unreceiving|token|GET|

**Param Data**
```
无
```

**Return Data**
```
{
	'unreceiving': 
	{
		'commodity1': { 'id': int, 'name': string, 'price': float }
		'commodity2': { 'id': int, 'name': string, 'price': float }
	}
}
```

3. 未评价订单

|URL|Header|Method|
|---|------|------|
|uncomment|token|GET|

**Param Data**
```
无
```

**Return Data**
```
{
	'uncomment': 
	{
		'commodity1': { 'id': int, 'name': string, 'price': float }
		'commodity2': { 'id': int, 'name': string, 'price': float }
	}
}
```

4. 全部订单

|URL|Header|Method|
|---|------|------|
|orderList|token|GET|

**Param Data**
```
无
```

**Return Data**
```
{
	'unreceiving': 
	{
		'commodity1': { 'id': int, 'name': string, 'price': float }
		'commodity2': { 'id': int, 'name': string, 'price': float }
	}
}
```

5. 获取收货地址

|URL|Header|Method|
|---|------|------|
|getAddress|token|GET|

**Param Data**
```
无
```

**Return Data**
```
{
	'address': {
		'addr1': { 'name': string, 'address': string, 'phone': string }
	}
}
```

6. 新增收货地址

|URL|Header|Method|
|---|------|------|
|addAddress|token|POST|

**Post Data**
```
name: string (收货人姓名)
address: string (收货地址)
phone: string (手机号)
```

**Return Data**
```
{
	'orderList': 
	{
		'commodity1': { 'id': int, 'name': string, 'price': float }
		'commodity2': { 'id': int, 'name': string, 'price': float }
	}
}
```

6. 编辑个人资料

|URL|Header|Method|
|---|------|------|
|setUSerInfo|token|POST|

**Post Data**
```
name: string (用户姓名)
gender: string (性别)
birthday:date (生日)
address: string (收货地址)
phone: string (手机号)
email: string (邮箱)
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

# 店铺管理页面

1. 新建店铺

|URL|Header|Method|
|---|------|------|
|addShop|token|POST|

**Post Data**
```
name: string (店铺名称)
description: string (店铺描述)
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

2. 获取店铺信息

|URL|Header|Method|
|---|------|------|
|getShop|token|GET|

**Param Data**
```
无
```

**Return Data**
```
{
	'shop': {
		'id': int (店铺id)
		'name': string,
		'description': string,
		'address': string,
		'phone': string,
		'email': string
	}
}
```

3. 设置店铺信息

|URL|Header|Method|
|---|------|------|
|setShop|token|GET|

**Post Data**
```
id: int（店铺id)
name: string,
description: string,
phone: string,
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

4. 获取新订单

|URL|Header|Method|
|---|------|------|
|getNewOrder|无|GET|

**Param Data**
```
id: int (店铺id)
```

**Return Data**
```
{
	'orderList': 
	{
		'order1': { 'id': int, 'name': string, 'type': string, 'address': string, 'price': float }
	}
}
```

4. 发货

|URL|Header|Method|
|---|------|------|
|send|无|POST|

**Post Data**
```
id: int (订单id)
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

5. 删除订单

|URL|Header|Method|
|---|------|------|
|deleteOrder|无|POST|

**Post Data**
```
id: int (订单id)
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

6. 获取已发货订单

|URL|Header|Method|
|---|------|------|
|getSended|无|GET|

**Param Data**
```
id: int (店铺id)
```

**Return Data**
```
{
	'orderList': 
	{
		'order1': { 'id': int, 'name': string, 'type': string, 'address': string, 'price': float }
	}
}
```

7. 获取商品列表

|URL|Header|Method|
|---|------|------|
|getCommodityList|无|GET|

**Param Data**
```
id: int (店铺id)
```

**Return Data**
```
{
	'commodityList': 
	{
		'commodity': { 'id': int, 'name': string }
	}
}
```

8. 获取商品信息

|URL|Header|Method|
|---|------|------|
|getCommodity|无|GET|

**Param Data**
```
id: int (商品id)
```

**Return Data**
```
{
	'commodity': { 'name': string, 'description': string, 'type': [type1, type2], 'price': float }
}
```

9. 上传商品图片

|URL|Header|Method|
|---|------|------|
|uploadCommodityImage|无|POST|

**Post Data**
```
id: int (商品id)
image: Base64 Binary
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
	'id': int
}
```

10. 编辑商品图片

|URL|Header|Method|
|---|------|------|
|editCommodityImage|无|POST|

**Post Data**
```
id: int (图片id)
image: Base64 Binary
```

**Return Data**
###删除原有图片
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

11. 新增商品

|URL|Header|Method|
|---|------|------|
|addCommodity|无|POST|

**Post Data**
```
id: int (店铺id)
pictureId: int(商品id)
name: string
details: string
category: int
storage: int
price: float
image: int
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

12. 新增商品类型

|URL|Header|Method|
|---|------|------|
|addCommodityType|无|POST|

**Post Data**
```
id: int (商品id)
type: List<String>
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

13. 编辑商品类型
|URL|Header|Method|
|---|------|------|
|editCommodityType|无|POST|

**Post Data**
```
id: int (商品id)
type: map<int, String>(id, name)
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

14. 编辑商品

|URL|Header|Method|
|---|------|------|
|editCommodity|无|POST|

**Post Data**
```
id: int (商品id)
name: string
details: string
category: int
storage: int
price: float
image: int
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

15. 删除商品

|URL|Header|Method|
|---|------|------|
|deleteCommodity|无|POST|

###删除商品、图片、类型

**Post Data**
```
id: int (商品id)
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```

# page: 管理员页面

1. 获取用户列表

|URL|Header|Method|
|---|------|------|
|getUserList|无|GET|

**Param Data**
```
无
```

**Return Data**
```
{
	'userList':
	{
		'user1': { 'id': int, 'name': string }
	}
}
```

2. 重置用户密码

|URL|Header|Method|
|---|------|------|
|resetPassword|无|POST|

**Post Data**
```
id: int (用户id)
```

**Return Data**
```
{
	'status': 'SUCCESS'/'ERROR'
}
```


3. 获取商品列表

|URL|Header|Method|
|---|------|------|
|getCommodityList|无|GET|

**Param Data**
```
无
```

**Return Data**
```
{
	'commodityList':
	{
		'commodity1': { 'id': int, 'name': string }
	}
}
```

4. 搜索用户

|URL|Header|Method|
|---|------|------|
|searchUser|无|GET|

**Param Data**
```
name/email: string
```

**Return Data**
```
{
	'user': { 'id': int, 'name': string, 'email': string }
}
```

5. 搜索商品

|URL|Header|Method|
|---|------|------|
|searchCommodity|无|GET|

**Param Data**
```
name: string
```

**Return Data**
```
{
	'commodityList': 
	{
		'commodity1': { 'id': int, 'name': string }
	}
}
```

