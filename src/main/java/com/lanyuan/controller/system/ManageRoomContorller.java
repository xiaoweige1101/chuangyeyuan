package com.lanyuan.controller.system;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.Cyy_roomFormMap;
import com.lanyuan.mapper.Cyy_roomMapper;
import com.lanyuan.plugin.PageView;
import com.lanyuan.util.Common;

@Controller
@RequestMapping("/room")
public class ManageRoomContorller extends BaseController {
	
	@Inject
	private Cyy_roomMapper roomMapper;
	

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
			List<Cyy_roomFormMap> roomList = roomMapper.getRoomPage();

			pageView.setRecords(roomList);
			pageView.setOrderby(sort);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return pageView;
	}
	
	
	
}