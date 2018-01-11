package com.cnema.movie;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	@Inject
	private ReviewDAO reviewDAO;

	/*희성*/
	public int reviewInsert(int movie_num, String id, String review) {
		return reviewDAO.reviewInsert(movie_num,id,review);
	}
}
