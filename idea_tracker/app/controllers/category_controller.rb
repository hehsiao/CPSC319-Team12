class CategoryController < ApplicationController

  # GET /category
  def index
  	@categories = Category.where(parent_id: 0).to_a
  end

  # GET /category/new
  def new
  	@category = Category.new
  end

  # GET /category/1/edit
  def edit
  	@category = Category.find(params[:id])
  end

  # POST /category
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      @category.parent_id = 0
      if @category.save
        format.html { redirect_to action: "index", notice: 'Category was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /category/1
  def update
  	@category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to action: "index", notice: 'Category was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end 

  # DELETE /categories/1
  def destroy
    @category.destroy
    respond_to do |format|
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category_name, :description, :type_id)
    end
end
