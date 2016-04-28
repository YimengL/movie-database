class CommentsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :edit, :destroy, :update, :new]
  
  def new
    @commented = Comment.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    if @commented
      flash[:danger] = "You've already commented it!"
      @movie = Movie.find(params[:movie_id])
      redirect_to movie_url(@movie)
    else
      @comment = Comment.new
    end
  end
  
  def create

    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
    else
      flash[:danger] = "Failed!"
    end
    @movie = Movie.find(@comment.movie_id)
    redirect_to movie_url(@movie)
    
  end
  
  def edit
    @commented = Comment.find_by(movie_id: params[:movie_id], user_id: current_user.id)
  end
  
  def update
#    debugger
    @commented = Comment.find(params[:id])
    if @commented.update_attributes(comment_params)
      #success
      flash[:success] = "UPDATE successfully!"
    else
      flash[:Failed] = "UPDATE failed!"
    end
    @movie = Movie.find(@commented.movie_id)
    redirect_to movie_url(@movie)
  end
  
  def destroy
    @commented = Comment.find(params[:id])
#    debugger
    @movie = Movie.find(@commented.movie_id)
    Comment.find(params[:id]).destroy
    flash[:success] = "Delete"
    redirect_to movie_url(@movie)
  end
  
private
  def comment_params
    params.require(:comment).permit(:comment, :rating, :user_id, :movie_id)
  end
  
end
