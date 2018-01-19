package com.cnema.movie;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cnema.util.FileSaver;


@Service
@Transactional
public class MovieService {
	@Inject
	private MovieDAO movieDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	//warningCheck
	public WarningDTO warningCheck(String id, int review_num) throws Exception {
		return movieDAO.warningCheck(id, review_num);
	}

	//warningList
	public List<WarningDTO> warningList(int review_num) throws Exception {
		return movieDAO.warningList(review_num);
	}
	
	//reviewWarning
	public int reviewWarning(String id, int review_num) throws Exception {
		int result = movieDAO.warningUpdate(review_num);
		result = movieDAO.warningInsert(id, review_num);
		return result;
	}

	//review_list
	public List<ReviewDTO> reviewList(int movie_num) throws Exception {
		return movieDAO.reviewList(movie_num);
	}

	public List<MovieDTO> qrMovieList() throws Exception {
		return movieDAO.qrMovieList();
	}
	
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
	public List<MovieDTO> movieSList() throws Exception {
		return movieDAO.movieSList();
	}
	/*heeseong*/
	public int movieRevision(MovieDTO movieDTO) throws Exception{
		return movieDAO.movieRevision(movieDTO);
	}
	/*heeseong*/
	public List<MovieDTO> movieSearchList(String kind,String search) throws Exception {
		return movieDAO.movieSearchList(kind,search);
	}
}
