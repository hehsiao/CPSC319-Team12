class CategoryController < ApplicationController
  before_action :check_permission

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
        params[:id] = @category.id
        handle_tags
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
        # here we update the tags
        handle_tags

        format.html { redirect_to action: "index", notice: 'Category was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end 

  # DELETE /categories/1
  def destroy
    @category = Category.find(params[:id])
    category_tags = Category.where(:parent_id => params[:id])
    category_tags.each do |tag|
      IdeaTag.connection.execute("delete from idea_tags where category_id = #{tag.id}")
    end
    category_tags.destroy_all
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  private
    # handle tags in edit category
    def handle_tags
      new_tags = params[:new_tags]
      old_tags = params[:old_tags]
      require_other = params[:require_other]
      if require_other
        Category.find_or_create_by_parent_id_and_category_name_and_type_id(params[:id], "Other: Please Specify", 5)
      else
        Category.where("parent_id = ? AND type_id = 5",  params[:id]).destroy_all
      end

      if new_tags
        new_tags.each do |tag|
          if !tag[1]["2"]
            Category.create(:parent_id => params[:id], :category_name => tag[1]["0"], :type_id => (tag[1]["1"] ? 6 : 1))
          end
        end
      end

      if old_tags
        old_tags.each do |tag|
          if !tag[1]["2"]
            Category.update(tag[0], :category_name => tag[1]["0"], :type_id => (tag[1]["1"] ? 6 : 1))
          else
            Category.delete(tag[0])
            IdeaTag.connection.execute("delete from idea_tags where category_id = #{tag[0]}")
          end
        end  
      end
    end

    # Checks user is admin, otherwise redirect to dashboard
    def check_permission
      if !current_user.try(:admin?)
        redirect_to new_user_session_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category_name, :description, :type_id)
    end
  end
