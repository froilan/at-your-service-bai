package com.aysb

class SearchController {

    def index() { 
		[employee:new Employee(params)]
	}
	
	def search(){
		def max = 5 //default search size
		def category = params.category
		def subcategory = params.subCategory
		def location = params.location
		Employee employee = new Employee(category:category, subCategory:subcategory, location:location)
		
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
		
		[employee:employee, results: results, count:count]
	}
}

