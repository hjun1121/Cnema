package com.cnema.movie;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.mock.web.portlet.MockActionRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.member.MemberDTO;
import com.cnema.util.FileSaver;


@Service
public class MovieService {
	@Inject
	private MovieDAO movieDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	public List<MovieDTO> movieList() throws Exception {
		return movieDAO.movieList();
	}
	
	public List<MovieDTO> gradeList() throws Exception {
		return movieDAO.gradeList();
	}
	
	public List<MovieDTO> open_dateList() throws Exception {
		return movieDAO.open_dateList();
	}
	
	public MovieDTO selectOne(int num) throws Exception{
		return movieDAO.selectOne(num);
	}

	public int insert(MovieDTO movieDTO, HttpSession session) throws Exception {
		MultipartFile file = movieDTO.getFile();
		String name = fileSaver.fileSave(file, session, "poster");
		movieDTO.setFileName(name);
		movieDTO.setOriName(file.getOriginalFilename());
		int result = movieDAO.insert(movieDTO);
		
		return result;
	}
	/*heeseong*/
	public MovieDTO movieInfo(int movie_num) throws Exception{
		return movieDAO.movieInfo(movie_num);
	}
}
