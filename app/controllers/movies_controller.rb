# frozen_string_literal: true

class MoviesController < ApplicationController # rubocop:todo Style/Documentation
  before_action :authenticate_user!
  before_action :set_movie, only: %i[show edit update destroy]

  # GET /movies or /movies.json
  def index
    @movies = Movie.where user_id: current_user.id
  end

  # GET /movies/1 or /movies/1.json
  def show
    return unless @movie.user_id != current_user.id

    redirect_to movies_url # check if movie vs movies
    nil
  end

  def admin
    if current_user.admin
      @movies = Movies.all
      render :index
    else
      redirect_to movies_url
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @movie.user_id = current_user.id
  end

  # GET /movies/1/edit
  def edit
    return unless @movie.user_id != current_user.id

    redirect_to movies_url
    nil
  end

  # POST /movies or /movies.json
  def create # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
    @movie = Movie.new(movie_params)
    if @movie.user_id != current_user.id
      redirect_to movies_url
      return
    end

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
    if @movie.user_id != current_user.id
      redirect_to movies_url
      return
    end
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    if @movie.user_id != current_user.id
      redirect_to movies_url
      return
    end
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :genre, :description, :director, :release_date, :run_time,
                                  :production_company, :review, :user_id)
  end
end
