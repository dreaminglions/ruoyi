package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.BizAreaWaterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizWaterWorkMapper;
import com.ruoyi.system.service.IBizWaterWorkService;
import com.ruoyi.common.core.text.Convert;

/**
 * 水厂 服务层实现
 * 
 * @author ruoyi
 * @date 2020-02-24
 */
@Service
public class BizWaterWorkServiceImpl implements IBizWaterWorkService 
{
	@Autowired
	private BizWaterWorkMapper bizWaterWorkMapper;
	@Autowired
	private BizAreaWaterMapper bizAreaWaterMapper;

	/**
     * 查询水厂信息
     * 
     * @param worksId 水厂ID
     * @return 水厂信息
     */
    @Override
	public BizWaterWork selectBizWaterWorkById(Long worksId)
	{
	    return bizWaterWorkMapper.selectBizWaterWorkById(worksId);
	}
	
	/**
     * 查询水厂列表
     * 
     * @param bizWaterWork 水厂信息
     * @return 水厂集合
     */
	@Override
	@DataScope(tableAlias = "d")
	public List<BizWaterWork> selectBizWaterWorkList(BizWaterWork bizWaterWork)
	{
	    return bizWaterWorkMapper.selectBizWaterWorkList(bizWaterWork);
	}

	/**
	 * 查询只符合水厂类型列表
	 *
	 * @param bizWaterWork 水厂信息
	 * @return 水厂集合
	 */
	@Override
	@DataScope(tableAlias = "d")
	public List<BizWaterWork> selectOnlyWorkList(BizWaterWork bizWaterWork)
	{
		return bizWaterWorkMapper.selectOnlyWorkList(bizWaterWork);
	}
	
    /**
     * 新增水厂
     * 
     * @param bizWaterWork 水厂信息
     * @return 结果
     */
	@Override
	public int insertBizWaterWork(BizWaterWork bizWaterWork)
	{
	    return bizWaterWorkMapper.insertBizWaterWork(bizWaterWork);
	}
	
	/**
     * 修改水厂
     * 
     * @param bizWaterWork 水厂信息
     * @return 结果
     */
	@Override
	public int updateBizWaterWork(BizWaterWork bizWaterWork)
	{
	    return bizWaterWorkMapper.updateBizWaterWork(bizWaterWork);
	}

	/**
     * 删除水厂对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteBizWaterWorkByIds(Long ids)
	{
		/**
		 * 1.判断是否有下级，有下级机构不允许删除
		 * 2.判断是否有化验数据，有化验数据不允许删除
		 * 3.删除机构为逻辑删除 del_flag=1
		 */
		int result = 0;
		int childCount = bizWaterWorkMapper.selectChildWork(ids);
		if(childCount > 0){
			result = -1;
			return result;
		}
		int assayCount = -2;//待补充
		if(assayCount > 0){
			result = -2;
			return result;
		}
		//删除区域水厂关联信息
		bizAreaWaterMapper.deleteByWaterId(ids);
		//暂时去掉物理删除
		//bizWaterWorkMapper.deleteBizWaterWorkByIds(Convert.toStrArray(ids));
		result = bizWaterWorkMapper.updateDelFlag(ids);
		return result;
	}

	/**
	 * 查询水厂管理树
	 *
	 * @param bizWaterWork 水厂信息
	 * @return 所有水厂信息
	 */
	@Override
	@DataScope(tableAlias = "d")
	public List<Ztree> selectWorksTree(BizWaterWork bizWaterWork){
		List<BizWaterWork> deptList = bizWaterWorkMapper.selectBizWaterWorkList(bizWaterWork);
		List<Ztree> ztrees = initZtree(deptList);
		return ztrees;
	}

	@Override
	public List<Ztree> selectAreaWaterTree(Long areaId) {
		List<BizWaterWork> waterWorks = bizWaterWorkMapper.selectAreaWaterTree(areaId);
		List<Long> areaWaters = bizAreaWaterMapper.selectAreaWaterByArea(areaId);
		List<Ztree> ztrees = initZtree(waterWorks,areaWaters,false);
		return ztrees;
	}

	/**
	 * 对象转水厂树
	 *
	 * @param workList 部门列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<BizWaterWork> workList)
	{
		return initZtree(workList, null);
	}

	/**
	 * 对象转水厂树
	 *
	 * @param workList 水厂列表
	 * @param roleWorkList 角色已存在菜单列表
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<BizWaterWork> workList, List<String> roleWorkList)
	{

		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(roleWorkList);
		for (BizWaterWork work : workList)
		{
			if (UserConstants.WORK_NORMAL.equals(work.getWorksStatus()))
			{
				Ztree ztree = new Ztree();
				ztree.setId(work.getWorksId());
				ztree.setpId(work.getParentId());
				ztree.setName(work.getWorksName());
				ztree.setTitle(work.getWorksName());
				if (isCheck)
				{
					ztree.setChecked(roleWorkList.contains(work.getWorksId() + work.getWorksName()));
				}
				ztrees.add(ztree);
			}
		}
		return ztrees;
	}

	/**
	 * 对象转区域水厂复选框树
	 *
	 * @param workList 水厂列表
	 * @param checkList 是否选中
	 * @param parentCheck 父级是否显示复选框
	 * @return 树结构列表
	 */
	public List<Ztree> initZtree(List<BizWaterWork> workList, List<Long> checkList,boolean parentCheck)
	{

		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(checkList);
		for (BizWaterWork work : workList)
		{
			if (UserConstants.WORK_NORMAL.equals(work.getWorksStatus()))
			{
				Ztree ztree = new Ztree();
				ztree.setId(work.getWorksId());
				ztree.setpId(work.getParentId());
				ztree.setName(work.getWorksName());
				ztree.setTitle(work.getWorksName());
				if(!parentCheck){
					if("1".equals(work.getWorksType()) || "2".equals(work.getWorksType())){
						ztree.setNocheck(true);
					}
				}
				if (isCheck) {
					ztree.setChecked(checkList.contains(work.getWorksId()));
				}
				ztrees.add(ztree);
			}
		}
		return ztrees;
	}

	/**
	 * 根据角色ID查询菜单
	 *
	 * @param role 角色对象
	 * @return 菜单列表
	 */
	public List<Ztree> roleWorkTreeData(SysRole role, SysUser user)
	{
		Long roleId = role.getRoleId();
		List<Ztree> ztrees = new ArrayList<Ztree>();
		List<BizWaterWork> workList = new ArrayList<BizWaterWork>();;

		if(user.isAdmin()){
			workList = selectBizWaterWorkList(new BizWaterWork());
		}else{
			workList = bizWaterWorkMapper.selectRoleWork(roleId);
		}
		if (StringUtils.isNotNull(roleId))
		{
			List<String> roleWorkList = bizWaterWorkMapper.selectRoleWorkTree(roleId);
			ztrees = initZtree(workList, roleWorkList);
		}
		else
		{
			ztrees = initZtree(workList);
		}
		return ztrees;
	}

	public List<WeatherEnity> selectWorksCode(){
		return bizWaterWorkMapper.selectWorksCode();
	}
	
}
