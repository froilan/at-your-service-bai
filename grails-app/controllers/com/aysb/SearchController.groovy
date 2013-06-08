package com.aysb

class SearchController {

    def index() { 
		[employee:new Employee(params)]
	}
	
	def search(){
		def category = params.category
		def subcategory = params.subcategory
	}
}
