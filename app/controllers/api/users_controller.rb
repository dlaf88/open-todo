class Api::UsersController < ApiController
  
  before_action :authenticated?

  def index
    return permission_denied_error unless authenticated?
    users = User.all
    render json: users, each_serializer: UsersSerializer
  end

  def create
    return permission_denied_error unless authenticated?
    user = User.new(user_params)
    if user.save
      render json: user, root: false, status: :created # 201
    else
      error :unprocessable_entity, user.errors.full_messages #422
    end
  end
  
   def destroy
     begin
       user = User.find(params[:id])
       user.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

  private

  def user_params
     params.require(:user).permit(:username, :password)
   end
  

end