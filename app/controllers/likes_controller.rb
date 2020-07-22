class LikesController < ApplicationController

  def new
  end

  def create
    @like = current_user.likes.build(like_params)
    if !@like.save
      p @like.errors.full_messages
    end
    redirect_to root_path
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to root_path
  end

  private


  def like_params
    params.require(:like).permit(:tweeet_id)
  end

end
