package com.cnema.community;

import javax.inject.Inject;

import com.cnema.util.FileSaver;

public class PageService {

	@Inject
	private PageDAO pageDAO;
	@Inject
	private FileSaver fileSaver;
	
}
