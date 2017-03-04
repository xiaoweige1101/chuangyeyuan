package com.lanyuan.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.ResUserFormMap;
import com.lanyuan.entity.UserFormMap;
import com.lanyuan.entity.UserGroupsFormMap;
import com.lanyuan.mapper.RoomMapper;
import com.lanyuan.util.Common;

@Controller
@RequestMapping("/manage")
public class ManageContorller extends BaseController {
	
	@Inject
	private RoomMapper roomMapper;
	
	/**********大楼管理*********/
	@RequestMapping("/building/list")
	public String listBuilding(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/manage/building/list";
	}
	
	@RequestMapping("/building/addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/manage/building/add";
	}
	
	@ResponseBody
	@RequestMapping("/building/deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-删除用户")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
//			userMapper.deleteByAttribute("userId", id, UserGroupsFormMap.class);
//			userMapper.deleteByAttribute("userId", id, ResUserFormMap.class);
//			userMapper.deleteByAttribute("id", id, UserFormMap.class);
		}
		return "success";
	}

	/**********房间管理************/
	@RequestMapping("/room/list")
	public String listRoom(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/manage/room/list";
	}
	
	
	
	/**********租客管理************/
	@RequestMapping("/guest/list")
	public String listGuest(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/manage/guest/list";
	}
	
	
}