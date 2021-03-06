package com.cnema.movie;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.theater.TheaterDTO;
import com.cnema.util.FileSaver;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;


@Service
@Transactional
public class MovieService {
	@Inject
	private MovieDAO movieDAO;
	@Inject
	private FileSaver fileSaver;
	
	public List<MovieDTO> homeMovieList() throws Exception{
		return movieDAO.homeMovieList();
	}
	
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
	
	//totalCount
	public int totalCount(int movie_num) throws Exception {
		return movieDAO.totalCount(movie_num);
	}

	//review_list
	public ModelAndView reviewList(int movie_num, ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(movieDAO.totalCount(movie_num));

		List<ReviewDTO> reviewList = movieDAO.reviewList(movie_num, rowNum);
		mv.addObject("pager", pager);
		mv.addObject("review", reviewList);
		return mv;
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

	public int movieInsert(MovieDTO movieDTO, HttpSession session) throws Exception {
		MultipartFile file = movieDTO.getFile();
		String name = fileSaver.fileSave(file, session, "movie_poster");
		movieDTO.setFileName(name);
		movieDTO.setOriName(file.getOriginalFilename());
		int result = movieDAO.movieInsert(movieDTO);

		return result;
	}
	
	/*heeseong*/
	public MovieDTO movieInfo(int movie_num) throws Exception{
		return movieDAO.movieInfo(movie_num);
	}
	
	/*heeseong*/
	public int mTotalCount(String kind, String search) throws Exception{
		return movieDAO.mTotalCount(kind, search);
	}
	/*heeseong*/
	public ModelAndView movieAList(String kind, String search, ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(movieDAO.mTotalCount(kind,search));
		
		List<MovieDTO> movieList = movieDAO.movieAList(kind, search, rowNum);
		mv.addObject("movieList", movieList);
		mv.addObject("pager",pager);
		return mv;
		/*return movieDAO.movieAList();*/
	}
	/*heeseong*/
	public int movieRevision(MovieDTO movieDTO) throws Exception{
		return movieDAO.movieRevision(movieDTO);
	}
	/*heeseong*/
	public List<MovieDTO> movieList(String kind,String search) throws Exception {
		return movieDAO.movieList(kind,search);
	}
}
