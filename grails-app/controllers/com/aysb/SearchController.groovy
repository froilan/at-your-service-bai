package com.aysb

class SearchController {

    def index() { 
		[employee:new Employee(params)]
	}
	
	def search(){
		println params
		def category = params.category
		def subcategory = params.subCategory
		def results = Employee.findAllByCategoryAndSubCategoryIlike(category, subcategory)
		println results
		//TODO: change redirect action
		redirect(action:"index", params:[subCategory:subcategory, category:category])
	}
}
