package com.lanyuan.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.Cyy_buildingFormMap;
import com.lanyuan.entity.Cyy_roomFormMap;
import com.lanyuan.exception.ParameterException;
import com.lanyuan.exception.SystemException;
import com.lanyuan.plugin.PageView;
import com.lanyuan.service.ManageRoomService;
import com.lanyuan.util.Common;

@Controller
@RequestMapping("/room")
public class ManageRoomContorller extends BaseController {

	final private static Logger logger = Logger.getLogger(ManageRoomContorller.class);

	@Autowired
	private ManageRoomService manageRoomService;

	/********** 房间管理 ************/
	@RequestMapping("/list")
	public String listRoom(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/room/list";
	}

	@ResponseBody
	@RequestMapping("/findByPage")
	public PageView findByPage(String pageNow, String pageSize, String column, String sort) throws Exception {
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
	@SystemLog(module = "系统管理", methods = "房间管理-新增房间") // 凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional(readOnly = false) // 需要事务操作必须加入此注解
	public String addEntity(HttpServletRequest request, HttpServletResponse response) {
		try {
			String buildingName = request.getParameter("buildingName");
			String roomName = request.getParameter("roomName");
			String roomPrice = request.getParameter("roomPrice");
			String desc = request.getParameter("desc");
			manageRoomService.addRoom(buildingName, roomName, roomPrice, desc);
		} catch (ParameterException e) {
			throw new ParameterException("大楼名称和房间名称已经存在");
		} catch (Exception e) {
			e.printStackTrace();
			throw new SystemException("添加账号异常");
		}
		return "success";
	}

	// 删除Guest
	@ResponseBody
	@RequestMapping("/deleteEntity")
	@Transactional(readOnly = false) // 需要事务操作必须加入此注解
	@SystemLog(module = "系统管理", methods = "用户管理-删除用户") // 凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			manageRoomService.deleteByRoomroomId(Integer.parseInt(id));
		}
		return "success";
	}

	@RequestMapping("shouzu")
	public String shouzu(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		try {
			String roomId = req.getParameter("roomId");
			Cyy_roomFormMap room = manageRoomService.getById(Integer.parseInt(roomId));
			int buildingId = room.getInt("buildingId");
			String roomName = room.getStr("roomName");
			int roomPrice = room.getInt("roomPrice").intValue();
			Cyy_buildingFormMap building = manageRoomService.getBuilding(buildingId);
			String buildingName = building.getStr("buildingName");
			String currentGuestId = String.valueOf(room.getInt("currentGuestId").intValue());


			String userId = Common.findUserSessionId(req);

			// manageRoomService.

			System.out.println("userId:" + userId);

			model.addAttribute("buildingName", buildingName);
			model.addAttribute("roomName", roomName);
			model.addAttribute("roomPrice", roomPrice);
			model.addAttribute("roomId", roomId);
			model.addAttribute("currentGuestId", currentGuestId);
		} catch (Exception e) {
			logger.error(ExceptionUtils.getFullStackTrace(e));
			throw e;
		}
		return Common.BACKGROUND_PATH + "/system/room/shouzu";
	}

	// 删除Guest
	@ResponseBody
	@RequestMapping("/shouzuEntity")
	@Transactional(readOnly = false) // 需要事务操作必须加入此注解
	@SystemLog(module = "系统管理", methods = "用户管理-删除用户") // 凡需要处理业务逻辑的.都需要记录操作日志
	public String shouzuEntity(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		try {
			String buildingName = req.getParameter("buildingName");
			String roomName = req.getParameter("roomName");
			String roomPrice = req.getParameter("roomPrice");
			String electMoney = req.getParameter("electMoney");
			String waterMoney = req.getParameter("waterMoney");
			String networkMoney = req.getParameter("networkMoney");
			String roomId = req.getParameter("roomId");
			String currentGuestId = req.getParameter("currentGuestId");
			String detail = req.getParameter("detail");
			String userId = Common.findUserSessionId(req);
			String nextRentTime = req.getParameter("nextRentTime");
			
			logger.info("buildingName:" + buildingName + ",roomName:" + roomName + ",roomPrice:" + roomPrice
					+ ",electMoney:" + electMoney + ",waterMoney:" + waterMoney + ",networkMoney:" + networkMoney);
			logger.info("roomId:" + roomId + ", userId:" + userId + ", nextJiaozuDate:" + nextRentTime);

			if (electMoney == null) {
				electMoney = "0";
			}

			if (waterMoney == null) {
				waterMoney = "0";
			}

			if (networkMoney == null) {
				networkMoney = "0";
			}

			manageRoomService.shouzu(Integer.parseInt(userId), Integer.parseInt(currentGuestId),
					Integer.parseInt(roomId), Integer.parseInt(roomPrice), Integer.parseInt(waterMoney),
					Integer.parseInt(electMoney), nextRentTime, detail);

			return "success";
		} catch (Exception e) {
			logger.error(ExceptionUtils.getFullStackTrace(e));
			return "failure";
		}

	}
}