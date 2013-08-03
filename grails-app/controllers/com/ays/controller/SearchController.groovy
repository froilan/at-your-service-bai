package com.ays.controller

import com.ays.Result;
import com.ays.Profile;
import org.compass.core.engine.SearchEngineQueryParseException;

class SearchController {

	def searchableService

	def index() {
		String query = params.q
		if (!query?.trim()) {
			return [:]
		}
		
		String location = params.location
		if (location?.trim()) {
			StringBuilder locationQuery = new StringBuilder(" (")
			locationQuery.append("streetBuildingAddress:").append(location).append(" OR ")
			locationQuery.append("barangay:").append(location).append(" OR ")
			locationQuery.append("cityTown:").append(location).append(" OR ")
			locationQuery.append("province:").append(location).append(")")
			query += locationQuery.toString()
		}
		def searchResult = Profile.search(query, params)
		
		//searchResult.total = searchResult.results.size()
		//searchResult.max = 3
		//tried to override searchResult.max pero lagi parin nag reresolve sa 10
		try {
     	   return [searchResult: Profile.search(query, params)]
    	} catch (SearchEngineQueryParseException ex) {
        	return [parseException: true]
    	}
	}

}

