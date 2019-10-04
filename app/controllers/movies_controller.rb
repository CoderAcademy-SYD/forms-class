class MoviesController < ApplicationController
    before_action :setup_session_movies
    
    def index
        @movies = session[:movies]
    end

    def create        
        session[:movies].push(params[:movie])

        redirect_to movie_path(session[:movies].length - 1)
    end

    def new

    end

    def show
        @movie = session[:movies][params[:id].to_i]
    end

    def edit
        @movie = session[:movies][params[:id].to_i]
        @movie_id = params[:id]
    end

    def update
        session[:movies][params[:id].to_i] = params[:movie]

        redirect_to movie_path(params[:id])
    end

    def setup_session_movies
        unless session.has_key?(:movies)
            session[:movies] = []
        end
    end
end