package com.ays

import com.ays.Result;

class Result {
	SiteUser siteUser;
	Profile employee;

	/********************************
	 *** Count
	 ********************************/

	public static int count(String category){
		List<Result> result = list(category)
		return result.size()
	}

	public static int count(String category, String subcategory){
		List<Result> result = list(category, subcategory)
		return result.size()
	}

	public static int count(String category, String subcategory, String location){
		List<Result> result = list(category, subcategory, location)
		return result.size()
	}


	/********************************
	*** Search By Category
	********************************/

	public static List<Result> list(String category){
		def employees = Profile.findAllByCategoryIlike(category)
		return siteUserBinder(employees);
	}

	//Default: Limited Search
	public static List<Result> list(String category, int max){
		def employees =  Profile.findAllByCategoryIlike(category,
									[max:max])
		return siteUserBinder(employees);
	}


	/********************************
	*** Search By Category and SubCategory
	********************************/

	public static List<Result> list(String category, String subcategory){
		def employees = Profile.findAllByCategoryAndSubCategoryIlike(category, subcategory)
		return siteUserBinder(employees);
	}

	//Default: Limited Search
	public static List<Result> list(String category, String subcategory, int max){
		def employees =  Profile.findAllByCategoryAndSubCategoryIlike(category, subcategory,
									[max:max])
		return siteUserBinder(employees);
	}


	/********************************
	 *** Search By Category, SubCategory, and Location
	 ********************************/

	public static List<Result> list(String category, String subcategory, String location){
		def criteria = Profile.createCriteria()
		def employees = criteria.list () {
			ilike("location", location+"%")
			and {
				ilike("category", category+"%")
				ilike("subCategory", subcategory+"%")
			}
			order("rating", "desc")
		}
		return siteUserBinder(employees);
	}

	// Default: Limited Advance Search
	public static List<Result> list(String category, String subcategory, String location, int max){
		def criteria = Profile.createCriteria()
		def employees = criteria.list (max:max) {
			ilike("location", location+"%")
			and {
				ilike("category", category+"%")
				ilike("subCategory", subcategory+"%")
			}
			order("rating", "desc")
		}
		return siteUserBinder(employees);
	}


	private static List<Result> siteUserBinder(employees){
		List<Result> results = new ArrayList<Result>();
		employees.each(){
			def result = new Result()
			result.employee = it
			result.siteUser = SiteUser.findByEmployee(it)
			results.add(result)
		}
		return results
	}
}
