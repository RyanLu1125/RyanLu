package tw.gameshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.gameshop.user.model.Game_EventService;
import tw.gameshop.user.model.Game_Event;

@Controller
public class EventController {

	private Game_EventService eventService;
	
	
	

	@Autowired
	public EventController(Game_EventService eventService) {
		this.eventService = eventService;
	}
	
	//test1
	@RequestMapping(path = "/processevent",method = RequestMethod.GET)
	public String Event() {
		return "test1";
	}
	
	@RequestMapping(path = "/addEvent",method = RequestMethod.POST)
	@ResponseBody
	public String addEvent(@RequestParam("productId")int productId,@RequestParam("startDate")String startDate, 
			@RequestParam("eventName")String eventName,@RequestParam("content")String content,
			@RequestParam("endDate")String endDate,@RequestParam("eventImage")MultipartFile eventImage)  {
				
		try {
			if(eventService.queryAllEvent()!= null) {
				Game_Event event = new Game_Event();
				event.setContent(content);
				event.setEventName(eventName);
				event.setProductId(productId);
				event.setStartDate(startDate);
				event.setEndDate(endDate);
				event.setEventImage(eventImage.getBytes());
				eventService.addEvent2(event);
			}
				return "Success";
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return "test1";
	}
	
	
	
	@RequestMapping(path = "/queryAllEvent",method = RequestMethod.POST )
	@ResponseBody
	public String queryAllData(Model model) {
		String eventJSON = eventService.queryAllEvent();
		
		model.addAttribute("Event",eventJSON);
//		System.out.println(eventJSON);
		return "test1";
	}
	
	
//	@ResponseBody
//	@RequestMapping(path = "/queryAll",method = RequestMethod.POST)
//	public  ModelAndView queryAllData2() {
//		ModelAndView modelAndView = new ModelAndView();
//	    List<Game_Event> queryAll = eventService.queryAllEvent2();
//	    modelAndView.addObject("AllEventList",queryAll);
//	    modelAndView.setViewName("/data/datalist");
//		return modelAndView;
//	}


}
