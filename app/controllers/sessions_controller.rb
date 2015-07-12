class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(telephone: params[:session][:telephone])
    if user && user.authenticate(params[:session][:password])
      puts 'ENTROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
    else
      render 'new'
    end
  end

  def destroy
  end

end
