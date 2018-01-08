package com.cnema.event;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EventService {

	@Inject
	private EventDAO eventDAO;
}
