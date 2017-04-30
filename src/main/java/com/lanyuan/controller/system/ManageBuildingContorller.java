package com.lanyuan.controller.system;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.Cyy_buildingFormMap;
import com.lanyuan.entity.Cyy_buildingUserFormMap;
import com.lanyuan.mapper.Cyy_buildingMapper;
import com.lanyuan.mapper.Cyy_buildingUserMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;

@Controller
@RequestMapping("/building")
public class ManageBuildingContorller extends BaseController {
	
	final private static Logger logger = Logger.getLogger(ManageBuildingContorller.class);
	
	@Inject
	private Cyy_buildingMapper buildingMapper;
	
	@Inject
	private Cyy_buildingUserMapper buildingUserMapper;
	
	
	//显示大楼列表UI
	@RequestMapping("/list")
	public String listBuilding(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/building/list";
	}
	
	//显示大楼Rest
	@ResponseBody
	@RequestMapping("/findByPage")
	public PageView findByPage(String pageNow, String pageSize,String column,String sort) throws Exception {
		Cyy_buildingFormMap buildingFormMap = getFormMap(Cyy_buildingFormMap.class);
		buildingFormMap=toFormMap(buildingFormMap, pageNow, pageSize, buildingFormMap.getStr("orderby"));

		try {
			buildingFormMap.put("column", column);
			buildingFormMap.put("sort", sort);
			List<Cyy_buildingFormMap> buildingList = buildingMapper.getBuildingPage(buildingFormMap);
			//添加合伙人信息
			for (Cyy_buildingFormMap building : buildingList) {
				List<Cyy_buildingUserFormMap> buildingUserList =  buildingUserMapper.getByBuildingId(building.getInt("id"));
				String partners = "";
				
				for (Cyy_buildingUserFormMap bu : buildingUserList) {
					partners += " " + bu.getStr("accountName");
				}
				
				building.set("partners", partners);
			}
			
			pageView.setRecords(buildingList);
			pageView.setOrderby(sort);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return pageView;
	}
	
	//添加大楼UI
	@RequestMapping("/addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/building/add";
	}
	
	//添加大楼Rest
	@ResponseBody
	@RequestMapping("/addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="大楼管理",methods="管理-新增大楼")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		String[] partnerGroupSelect = request.getParameterValues("partnerGroupSelect");
		String buildingName = request.getParameter("cyy_building.buildingName");
		String desc = request.getParameter("cyy_building.desc");
		
		logger.info("partnerGroupSelect:" + partnerGroupSelect + ", buildingName:" + buildingName + ", desc:" + desc);
		
		Cyy_buildingFormMap buildingFormMap = new Cyy_buildingFormMap();
		buildingFormMap.put("buildingName", buildingName);
		buildingFormMap.put("desc", desc);
		
		buildingMapper.addOrUpdateByBuildingName(buildingFormMap);
		
		return "success";
	}
	
	//删除大楼Rest
	@ResponseBody
	@RequestMapping("/deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-删除用户")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			buildingMapper.deleteById(Integer.parseInt(id));
		}
		return "success";
	}

	//获取大楼列表页面
	@RequestMapping("/getBuildingListDiv")
	public String getBuildingListDiv(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		List<Cyy_buildingFormMap> buildingList = buildingMapper.getBuildingPage(null);
		
		model.addAttribute("buildingList", buildingList);
		return Common.BACKGROUND_PATH + "/system/building/buildingListDiv";
	}
	
}