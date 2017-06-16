package com.taotao.rest.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.taotao.common.pojo.TaotaoResult;
import com.taotao.common.utils.JsonUtils;
import com.taotao.mapper.TbItemDescMapper;
import com.taotao.mapper.TbItemMapper;
import com.taotao.mapper.TbItemParamItemMapper;
import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbItemDesc;
import com.taotao.pojo.TbItemParamItem;
import com.taotao.pojo.TbItemParamItemExample;
import com.taotao.pojo.TbItemParamItemExample.Criteria;
import com.taotao.rest.dao.JedisClient;
import com.taotao.rest.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private TbItemMapper itemMapper;
	@Autowired
	private TbItemDescMapper itemDescMapper;
	@Autowired
	private TbItemParamItemMapper itemParamItemMapper;
	
	@Autowired
	private JedisClient jedisClient;
	
	@Value("${REDIS_ITEM_KEY}")
	private String REDIS_ITEM_KEY;
	@Value("${REDIS_ITEM_EXPIRE}")
	private Integer REDIS_ITEM_EXPIRE;
	
	@Override
	public TaotaoResult getItemBaseInfo(long itemId) {
		
		try {
			String result = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":base");
			if (!StringUtils.isBlank(result)) {
				TbItem item = JsonUtils.jsonToPojo(result, TbItem.class);
				return TaotaoResult.ok(item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		TbItem item = itemMapper.selectByPrimaryKey(itemId);
		
		try {
			String cacheString = JsonUtils.objectToJson(item);
			jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":base", cacheString);
			//设置key在redis中的缓存有效期。
			jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":base", REDIS_ITEM_EXPIRE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return TaotaoResult.ok(item);
	}

	@Override
	public TaotaoResult getItemDesc(long itemId) {
		
		try {
			String result = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":desc");
			if (!StringUtils.isBlank(result)) {
				TbItemDesc itemDesc = JsonUtils.jsonToPojo(result, TbItemDesc.class);
				return TaotaoResult.ok(itemDesc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		TbItemDesc itemDesc = itemDescMapper.selectByPrimaryKey(itemId);
		
		try {
			String cacheString = JsonUtils.objectToJson(itemDesc);
			jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":desc", cacheString);
			jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":desc", REDIS_ITEM_EXPIRE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return TaotaoResult.ok(itemDesc);
	}

	@Override
	public TaotaoResult getItemParam(long itemId) {
		
		try {
			String result = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":param");
			if (!StringUtils.isBlank(result)) {
				TbItemParamItem itemParam = JsonUtils.jsonToPojo(result, TbItemParamItem.class);
				return TaotaoResult.ok(itemParam);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		TbItemParamItemExample example = new TbItemParamItemExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andItemIdEqualTo(itemId);
		List<TbItemParamItem> list = itemParamItemMapper.selectByExampleWithBLOBs(example);
		if (list != null && list.size() > 0) {
			TbItemParamItem itemParam = list.get(0);
			
			try {
				String cacheString = JsonUtils.objectToJson(itemParam);
				jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":param", cacheString);
				jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":param", REDIS_ITEM_EXPIRE);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return TaotaoResult.ok(itemParam);
		} else {
			return TaotaoResult.build(400, "无该商品相关参数信息");
		}
		
	}

}
