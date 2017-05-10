package com.movie.dao.api;


import java.util.List;

import com.movie.form.Actor;
import com.movie.form.Movie;

public interface ActorDao {
	public Actor getActorById(int id);

	public List<Actor> getActorByKeyWordPage(String keyword, int page,
			int pageSize);
	
	public long getActorCount(String keyword);

	boolean updateActor(Actor actor);

	boolean deleteActor(Actor actor);
	
	
}
