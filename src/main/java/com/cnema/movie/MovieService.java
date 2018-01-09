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
	
	
	public List<MovieDTO> movieList(String kind) throws Exception {
		return movieDAO.movieList(kind);
	}
	
	public List<WishDTO> wishList() throws Exception {
		return movieDAO.wishList();
	}
	
	public List<WishDTO> wishList(String id) throws Exception {
		return movieDAO.wishList(id);
	}
	
	public MovieDTO selectOne(int movie_num) throws Exception{
		return movieDAO.selectOne(movie_num);
	}
	
	public int movieWish(String id, int movie_num) throws Exception {
		int result = movieDAO.movieWish(movie_num);
		result = movieDAO.wishInsert(id, movie_num);
		return result;
	}

	public int movieWishReturn(String id, int movie_num) throws Exception {
		int result = movieDAO.movieWishReturn(movie_num);
		result = movieDAO.wishDelete(id, movie_num);
		return result;
	}

	public int insert(MovieDTO movieDTO, HttpSession session) throws Exception {
		MultipartFile file = movieDTO.getFile();
		String name = fileSaver.fileSave(file, session, "movie_poster");
		movieDTO.setFileName(name);
		movieDTO.setOriName(file.getOriginalFilename());
		int result = movieDAO.insert(movieDTO);

		return result;
	}
	
	/*heeseong*/
	public MovieDTO movieInfo(int movie_num) throws Exception{
		return movieDAO.movieInfo(movie_num);
	}
	/*heeseong*/
	public List<MovieDTO> movieAList() throws Exception {
		return movieDAO.movieAList();
	}
	/*heeseong*/
	public int movieRevision(MovieDTO movieDTO) throws Exception{
		return movieDAO.movieRevision(movieDTO);
	}
}
