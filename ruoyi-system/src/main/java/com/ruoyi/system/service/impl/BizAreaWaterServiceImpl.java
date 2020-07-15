package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.BizAreaWater;
import com.ruoyi.system.mapper.BizAreaWaterMapper;
import com.ruoyi.system.service.IBizAreaWaterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 设备 服务层实现
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Service
public class BizAreaWaterServiceImpl implements IBizAreaWaterService
{
	@Autowired
	private BizAreaWaterMapper areaWaterMapper;

	@Override
	public List<BizAreaWater> selectBizAreaWaterList(BizAreaWater areaWater) {
		return areaWaterMapper.selectBizAreaWaterList(areaWater);
	}

	@Override
	public List<Long> selectAreaWaterByArea(Long areaId) {
		return areaWaterMapper.selectAreaWaterByArea(areaId);
	}

	@Override
	public int batchInsertBizAreaWater(Long areaId,String waterIds) {
		//第一步 根据areaId删除元数据
		int rows = areaWaterMapper.deleteByAreaId(areaId);
		//第二步 批量插入数据
		List<BizAreaWater> list = new ArrayList<BizAreaWater>();
		if(null!=waterIds && !"".equals(waterIds)){
			String[] waterId = waterIds.split(",");
			for (String id : waterId)
			{
				BizAreaWater areaWater = new BizAreaWater();
				areaWater.setAreaId(areaId);
				areaWater.setWaterId(Long.valueOf(id));
				list.add(areaWater);
			}
		}
		if (list.size() > 0)
		{
			rows = areaWaterMapper.batchInsertBizAreaWater(list);
		}
		return rows;
	}

	@Override
	public int deleteByAreaId(Long areaId) {
		return areaWaterMapper.deleteByAreaId(areaId);
	}

	@Override
	public int deleteByWaterId(Long waterId) {
		return areaWaterMapper.deleteByWaterId(waterId);
	}
}
