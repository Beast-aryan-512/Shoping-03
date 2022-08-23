class UsersController < ApplicationController

  def index
      # UserMailer.example(User.new(email: 'test@gmail.com')).deliver
      @users = User.all
  end

end
