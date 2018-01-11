package com.cnema.community;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cnema.util.FileSaver;

@Service
public class CommunityService {

	@Inject
	private CommunityService communityService;
	@Inject
	private FileSaver fileSaver;
	
}
