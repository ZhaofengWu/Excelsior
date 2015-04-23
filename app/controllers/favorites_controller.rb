class FavoritesController < ApplicationController
  #before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /favorites
  # GET /favorites.json
  # def index
  #   @favorites = Favorite.all
  # end

  def add_to_favorite
    if current_user.favorites.count == 0
      current_user.favorites.create
    end
    if not current_user.favorites[0].answers.to_a.include? Answer.find(params[:answer_id])
      #current_user.favorites[0].answers.to_a << Answer.find(params[:answer_id])
      @favorite = current_user.favorites[0]
      @favorite.answers << Answer.find(params[:answer_id])
      @favorite.save
      current_user.favorites[0].inc(answers_count: 1)
      redirect_to Answer.find(params[:answer_id]).question, notice: 'Created successfully'
    else
      redirect_to Answer.find(params[:answer_id]).question, notice: 'Favorites already contain this answer'
    end
  end

  def remove_from_favorite
    @favorite = current_user.favorites[0]
    @favorite.answers.delete Answer.find(params[:answer_id])
    @favorite.save
    redirect_to myself_path(index: 1), notice: 'Removed successfully'
  end

#   # GET /favorites/1
#   # GET /favorites/1.json
#   def show
#     raise
#   end

#   # GET /favorites/new
#   def new
#     @favorite = Favorite.new
#   end

#   # GET /favorites/1/edit
#   def edit
#   end

#   # POST /favorites
#   # POST /favorites.json
#   def create
#     @favorite = Favorite.new(favorite_params)

#     respond_to do |format|
#       if @favorite.save
#         format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
#         format.json { render :show, status: :created, location: @favorite }
#       else
#         format.html { render :new }
#         format.json { render json: @favorite.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /favorites/1
#   # PATCH/PUT /favorites/1.json
#   def update
#     respond_to do |format|
#       if @favorite.update(favorite_params)
#         format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
#         format.json { render :show, status: :ok, location: @favorite }
#       else
#         format.html { render :edit }
#         format.json { render json: @favorite.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /favorites/1
#   # DELETE /favorites/1.json
#   def destroy
#     @favorite.destroy
#     respond_to do |format|
#       format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_favorite
#       @favorite = Favorite.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def favorite_params
#       params[:favorite]
#     end
end
