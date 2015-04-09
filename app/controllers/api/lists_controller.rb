class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    user = find_user
    return user_not_found_error unless user

    if params[:password] && user.authenticate?(params[:password])
      render json: user.lists, each_serializer: ListSerializer
    else
      render json: user.lists.public
    end
  end

 def create
    user = find_user
    return user_not_found_error unless user
    return permission_denied_error unless authenticated?


    list = user.lists.build(list_params)
    if list.save
      render json: list, root: false, status: :created 
    else
      error :unprocessable_entity, list.errors.full_messages 
    end
  end
  
  def update
   list = List.find(params[:id])
   if list.update(list_params)
     render json: list.to_json
   else
     render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
   end
 end

  private

  def list_params
    params.require(:list).permit(:user_id, :name, :permissions)
  end

  def find_user
    User.where(id: params[:user_id]).first
  end


end