class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @categories = Category.where(parent_id: 0).to_a
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    @categories = Category.where(parent_id: 0).to_a
  end

  # GET /ideas/1/edit
  def edit
    @categories = Category.where(parent_id: 0).to_a
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    #@poop = params
    respond_to do |format|
      if @idea.save
        params[:id] = @idea.id
        handle_category_tags
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idea }
      else
        format.html { render action: 'new' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        params[:id] = @idea.id
        handle_category_tags
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    Tag.connection.execute("delete from tags where idea_id = #{params[:id]}")
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  private

    def handle_category_tags
      Tag.connection.execute("delete from tags where idea_id = #{params[:id]}")
      cat_tags = params[:cat_tag]
      cat_tag_data = params[:cat_tag_data]
      if cat_tags 
        cat_tags.each do |tag|
          if cat_tag_data and cat_tag_data.has_key?(tag)
            Tag.create(:idea_id => params[:id], :category_id => tag, :additional_text => cat_tag_data[tag])
          else
            Tag.create(:idea_id => params[:id], :category_id => tag)
          end
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:user_id, :description, :provider_id, :receiver_id, :submission_date, :last_modified, :status_date_change)
    end
end
