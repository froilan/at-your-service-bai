package com.ays



import org.junit.*
import grails.test.mixin.*

@TestFor(SubCategoryController)
@Mock(SubCategory)
class SubCategoryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subCategory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subCategoryInstanceList.size() == 0
        assert model.subCategoryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subCategoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subCategoryInstance != null
        assert view == '/subCategory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subCategory/show/1'
        assert controller.flash.message != null
        assert SubCategory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subCategory/list'

        populateValidParams(params)
        def subCategory = new SubCategory(params)

        assert subCategory.save() != null

        params.id = subCategory.id

        def model = controller.show()

        assert model.subCategoryInstance == subCategory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subCategory/list'

        populateValidParams(params)
        def subCategory = new SubCategory(params)

        assert subCategory.save() != null

        params.id = subCategory.id

        def model = controller.edit()

        assert model.subCategoryInstance == subCategory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subCategory/list'

        response.reset()

        populateValidParams(params)
        def subCategory = new SubCategory(params)

        assert subCategory.save() != null

        // test invalid parameters in update
        params.id = subCategory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subCategory/edit"
        assert model.subCategoryInstance != null

        subCategory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subCategory/show/$subCategory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subCategory.clearErrors()

        populateValidParams(params)
        params.id = subCategory.id
        params.version = -1
        controller.update()

        assert view == "/subCategory/edit"
        assert model.subCategoryInstance != null
        assert model.subCategoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subCategory/list'

        response.reset()

        populateValidParams(params)
        def subCategory = new SubCategory(params)

        assert subCategory.save() != null
        assert SubCategory.count() == 1

        params.id = subCategory.id

        controller.delete()

        assert SubCategory.count() == 0
        assert SubCategory.get(subCategory.id) == null
        assert response.redirectedUrl == '/subCategory/list'
    }
}
