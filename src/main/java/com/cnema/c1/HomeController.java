package com.cnema.c1;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cnema.board.BoardDTO;
import com.cnema.event.EventService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.notice.NoticeDTO;
import com.cnema.notice.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private EventService eventService;
	@Inject
	private NoticeService noticeService;
	@Inject
	private MovieService movieService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, String message) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		List<BoardDTO> ar = null;
		List<NoticeDTO> noticeList = null;
		List<MovieDTO> movieList = null;
		
		String formattedDate = dateFormat.format(date);
		try {
			ar= eventService.selectList();
			noticeList = noticeService.noticeList();
			movieList = movieService.homeMovieList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("message", message);
		model.addAttribute("event_list", ar);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("movieList", movieList);
		return "home";
	}
	
	
}
