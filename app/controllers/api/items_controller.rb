class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
     if .save
       render json: item, root: false, status: :created 
    else
       error :unprocessable_entity, item.errors.full_messages 
    end
  end 


end