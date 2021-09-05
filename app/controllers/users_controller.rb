class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friend
  end

  def search
     if params[:friend].present?
        @friends = User.search(params[:friend])
        @friends = current_user.except_current_user(@friends)
        if @friends
          respond_to do |format|
            format.js {render partial: 'users/friend_result'}
          end
          
        else
          respond_to do |format|
            flash.now[:alert] = "could not find user"
            format.js {render partial: 'users/friend_result'}
          end
          
        end
      else
        respond_to do |format|
          flash.now[:alert] = "please enter a friend name or email"
          format.js {render partial: 'users/friend_result'}
        end
      end
  end
end
