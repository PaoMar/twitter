class SessionsController < ApplicationController
  before_action :redirect_if_authenticate, :only => [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id 
        flash[:notice] = "Authenticated successfully"
        render text: "User #{session[:user_id]} authenticate successfully!"
    else
        @user = User.new #se coloca para quitar el error cuando no existe usuario
        flash[:alert]= "Username or password invalid" #es un hash q se guarda dentro de la sesion, solo se puede mostrar una vez y se borra
        render :new
    end
    #render text: params #muestra en el navegador el valor de la variable q le pase
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def redirect_if_authenticate
    redirect_to (tweets_path) if current_user
  end
end
