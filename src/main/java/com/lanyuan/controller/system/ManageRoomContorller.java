package com.lanyuan.controller.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.Cyy_roomFormMap;
import com.lanyuan.entity.UserFormMap;
import com.lanyuan.entity.UserGroupsFormMap;
import com.lanyuan.exception.SystemException;
import com.lanyuan.plugin.PageView;
import com.lanyuan.service.ManageRoomService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PasswordHelper;

@Controller
@RequestMapping("/room")
public class ManageRoomContorller extends BaseController {
	
	@Autowired
	private ManageRoomService manageRoomService;

	/**********房间管理************/
	@RequestMapping("/list")
	public String listRoom(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/room/list";
	}
	
	@ResponseBody
	@RequestMapping("/findByPage")
	public PageView findByPage( String pageNow, String pageSize,String column,String sort) throws Exception {
		Cyy_roomFormMap roomFormMap = getFormMap(Cyy_roomFormMap.class);
		roomFormMap = toFormMap(roomFormMap, pageNow, pageSize, roomFormMap.getStr("orderby"));

		try {
			roomFormMap.put("column", column);
			roomFormMap.put("sort", sort);
			
			List<Cyy_roomFormMap> roomList = manageRoomService.getRoomList();
			
			pageView.setRecords(roomList);
			pageView.setOrderby(sort);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return pageView;
	}
	
	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/room/add";
	}
	
	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="用户管理-新增用户")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String addEntity(String txtGroupsSelect){
		try {
			UserFormMap userFormMap = getFormMap(UserFormMap.class);
			userFormMap.put("txtGroupsSelect", txtGroupsSelect);
			PasswordHelper passwordHelper = new PasswordHelper();
			userFormMap.set("password","123456789");
			passwordHelper.encryptPassword(userFormMap);
//			userMapper.addEntity(userFormMap);//新增后返回新增信息
			if (!Common.isEmpty(txtGroupsSelect)) {
				String[] txt = txtGroupsSelect.split(",");
				UserGroupsFormMap userGroupsFormMap = new UserGroupsFormMap();
				for (String roleId : txt) {
					userGroupsFormMap.put("userId", userFormMap.get("id"));
					userGroupsFormMap.put("roleId", roleId);
//					userMapper.addEntity(userGroupsFormMap);
				}
			}
		} catch (Exception e) {
			 throw new SystemException("添加账号异常");
		}
		return "success";
	}
	
}