class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    if params[:keyword]
      @ideas = Idea.tagged_with(params[:keyword])
    else
      @ideas = Idea.all
    end
    # @user = User.find(params[:user_id])
    # @ideas = @user.ideas
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @status = Status.find(@idea.status)
    # @provider = Partner.find(@idea.provider_partner_id).partner_name
    @provider = params[:provider_partner_id]
    if @idea.receiver_partner_id != nil
      @receiver = Partner.find(@idea.receiver_partner_id).partner_name
    else 
      @receiver = "None Assigned"
    end

  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    @partner = Partner.new
  end

  # GET /ideas/1/edit
  def edit
    #ronald's note: this is not right currently, because it resets the partner (obviously), just using it currently to debug.
    @partner = Partner.new
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
#    @idea.provider_partner_id = params[:provider_partner_id]
    respond_to do |format|
      if @idea.save
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
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:user_id, :description, :provider_partner_id, :receiver_partner_id, :keyword_list, :submission_date, :last_modified, :status_date_change)

    end

    def partner_params  
      params.require(:partner).permit(:provider_partner_id)
      # params.require(:status).permit(:id)
    end
end
