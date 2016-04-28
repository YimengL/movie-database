class MoviesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy, :update, :new]
  before_action :admin_user, only: [:create, :edit, :destroy, :update, :new]
   
  def index
    @movies = Movie.paginate(page: params[:page])
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      flash[:success] = "Movie created!"
      redirect_to movie_url(@movie)
    else
      redirect_to 'new'
    end
  end
  
  def destroy
  end

private
  
  def movie_params
    params.require(:movie).permit(:name, :content, :user_id, :picture)
  end
  
end
