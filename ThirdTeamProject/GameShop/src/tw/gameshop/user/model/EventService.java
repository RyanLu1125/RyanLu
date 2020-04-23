package tw.gameshop.user.model;

import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EventService {

	@Autowired
	private EventDAO eventDao;

	public EventService() {
	}

	public EventService(EventDAO eventDao) {
		this.eventDao = eventDao;
	}

	public String queryAllEvent() {
		return eventDao.queryAllEvent();
	}
	
	public Game_Event queryEvent(int eventId) {
		return eventDao.queryEvent(eventId);
	}

	public Game_Event addEvent( int productId, String startDate, String eventName, String content,
			String endDate) {
		return eventDao.addEvent( productId, startDate, eventName, content, endDate);
	}
	
	public Game_Event addEvent2(Game_Event event) {
		return eventDao.addEvent2(event);
	}
	
	public void deleteEvent(int eventId) {
		eventDao.deleteEvent(eventId);
	}
	
	public boolean upDateEvent(int eventId,Game_Event gEvent) {
		return eventDao.upDateEvent(eventId, gEvent);
	}

}
