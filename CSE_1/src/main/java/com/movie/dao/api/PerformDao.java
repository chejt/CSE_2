package com.movie.dao.api;


import java.util.List;

import com.movie.form.Movie;
import com.movie.form.Performs;

public interface PerformDao {
	public List<Performs> getPerformByActorId(int actorId);
	public List<Performs> getPerformByMoiveId(int movieId);
	public boolean deletePerform(Performs pId);
}
