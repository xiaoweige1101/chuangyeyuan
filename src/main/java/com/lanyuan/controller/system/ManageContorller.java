package com.lanyuan.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.mapper.RoomMapper;
import com.lanyuan.util.Common;

@Controller
@RequestMapping("/manage")
public class ManageContorller extends BaseController {
	
	@Inject
	private RoomMapper roomMapper;

	@RequestMapping("/room/list")
	public String list(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/manage/list";
	}
	
	
	
}