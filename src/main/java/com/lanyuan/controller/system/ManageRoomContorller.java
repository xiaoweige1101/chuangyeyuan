package com.lanyuan.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.mapper.Cyy_buildingMapper;
import com.lanyuan.mapper.Cyy_roomMapper;
import com.lanyuan.util.Common;

@Controller
@RequestMapping("/room")
public class ManageRoomContorller extends BaseController {
	
	@Inject
	private Cyy_buildingMapper buildingMapper;
	
	@Inject
	private Cyy_roomMapper roomMapper;
	

	/**********房间管理************/
	@RequestMapping("/list")
	public String listRoom(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/room/list";
	}
	
	
	
	/**********租客管理************/
	@RequestMapping("/guest/list")
	public String listGuest(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/guest/list";
	}
	
	
}