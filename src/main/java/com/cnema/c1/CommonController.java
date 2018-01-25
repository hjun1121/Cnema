package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;

@Controller
@RequestMapping(value="/common/**")
public class CommonController {

	@Inject
	private TheaterService theaterService;
	
	@RequestMapping(value="map", method=RequestMethod.GET)
	public void map(Model model, String area, @RequestParam(defaultValue="1", required=false)int theater_num){
		List<TheaterDTO> theaterList = null;
		List<TheaterDTO> locationList = null;
		TheaterDTO theaterDTO = null;
		if(area == null){
			area = "서울";
		}
		try {
			theaterList = theaterService.qrAreaList();
			locationList = theaterService.locationList(area);
			theaterDTO = theaterService.selectOne(theater_num);
			model.addAttribute("x_position", theaterDTO.getX_position());
			model.addAttribute("y_position", theaterDTO.getY_position());
			model.addAttribute("theaterName", theaterDTO.getLocation());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("area", area);
		model.addAttribute("theater_num", theater_num);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("locationList", locationList);
	}
	
	@RequestMapping(value="result", method=RequestMethod.GET)
	public void result(String message, Model model){
		model.addAttribute("message", message);
	}
	
	@RequestMapping(value="resultClose", method=RequestMethod.GET)
	public void resultClose(String message, Model model){
		model.addAttribute("message", message);
	}
}
