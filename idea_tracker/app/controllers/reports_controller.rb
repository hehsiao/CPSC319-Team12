class ReportsController < ApplicationController
  def index
  end
  
  def success_rate
	@users = User.all
  end
  
  def status
	@status = Status.all
  end
end
