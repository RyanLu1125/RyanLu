package tw.gameshop.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;


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
		return "EventPages";
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
				eventService.addEvent(event);
			}
				return "Success";
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return "EventPages";
	}
	
	
	@ResponseBody
	@RequestMapping(path = "/queryAllEvent",method = RequestMethod.GET )
	public List<Game_Event> queryAllData(Model model) {
		String eventJSON = eventService.queryAllEvent();
		List<Game_Event> eventList = eventService.queryAllEvent2();
//		model.addAttribute("GameEvent",eventJSON);
//		model.addAttribute("GameEvent2",eventList);
//    	System.out.println(eventJSON);
//    	System.out.println(eventList);
		System.out.println("start controller");
		return eventList;
	}
	
	
	@RequestMapping(path = "/deleteEvent",method = RequestMethod.POST)
	public void deleteEvent() {
		
	}



}
