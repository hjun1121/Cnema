package com.cnema.movie;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReviewService {
	@Inject
	private ReviewDAO reviewDAO;

	/*희성코드*/
	public int reviewInsert(int movie_num, String id, String review) throws Exception {
		return reviewDAO.reviewInsert(movie_num,id,review);
	}

	public int reviewCount(int movie_num, String id) throws Exception {
		return reviewDAO.reviewCount(movie_num,id);
	}

	public ReviewDTO reviewInfo(int movie_num, String id) throws Exception {
		return reviewDAO.reviewInfo(movie_num,id);
	}

	public int reviewRemove(int movie_num, String id) throws Exception {
		return reviewDAO.reviewRemove(movie_num,id);
	}
}
