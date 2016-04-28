class MoviesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy, :update, :new]
  before_action :admin_user, only: [:create, :edit, :destroy, :update, :new]
   
  def index
    @movies = Movie.all
    @movies = Movie.search(params[:name]) if params[:name].present?
    @movies = @movies.paginate(page: params[:page], per_page:15)
  end
  
  def show
    @movie = Movie.find(params[:id])
    @avg_score = Comment.where(movie_id: params[:id]).average(:rating)
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
      render 'new'
    end
  end
  
  def destroy
  end

private
  
  def movie_params
    params.require(:movie).permit(:name, :content, :user_id, :picture)
  end
  
end
