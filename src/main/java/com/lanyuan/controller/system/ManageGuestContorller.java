package com.lanyuan.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.util.Common;

@Controller
@RequestMapping("/guest")
public class ManageGuestContorller extends BaseController {
	

	
	/**********租客管理************/
	@RequestMapping("/list")
	public String listGuest(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/guest/list";
	}
	
	
}