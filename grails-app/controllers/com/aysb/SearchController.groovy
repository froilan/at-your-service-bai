package com.aysb

class SearchController {

    def index() { 
		[employee:new Employee(params)]
	}
	
	def search(){
		def category = params.category
		def subcategory = params.subCategory
		def results = Employee.findAllByCategoryAndSubCategoryIlike(category, subcategory, [max:5]) //sort by rating
		def count = Employee.countByCategoryAndSubCategoryIlike(categoy, subcategory)
		redirect(action:"view", params:[subCategory:subcategory, category:category])
	}
	
	def view(){
		//TODO
		[params:params]
	}
}
