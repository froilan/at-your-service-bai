package com.ays.controller

import com.ays.Result;
import com.ays.Profile;

class SearchController {

    def index() { 
		[profile:new Profile(params)]
	}
	
	def search(){
		def max = 5 //default search size
		def category = params.category
		def subcategory = params.subCategory
		def location = params.location
		Profile profile = new Profile(category:category, subCategory:subcategory, location:location)
		
		//default limited searching
		def results = []
		def count = 0
		if (category && !subcategory && !location) {
			results = Result.list(category, max)
			count = Result.count(category)
		} else if (category && subcategory && !location) {
			results = Result.list(category, subcategory, max)
			count = Result.count(category, subcategory)
		} else {
			results = Result.list(category, subcategory, location, max)
			count = Result.count(category, subcategory, location)
		}
		
		[employee:profile, results: results, count:count]
	}
}

