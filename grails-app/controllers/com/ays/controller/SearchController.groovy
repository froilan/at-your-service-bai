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
			query += (" address:" + location)
		}

		try {
     	   return [searchResult: Profile.search(query, params)]
    	} catch (SearchEngineQueryParseException ex) {
        	return [parseException: true]
    	}
	}

}

