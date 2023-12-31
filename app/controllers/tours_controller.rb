class ToursController < ApplicationController
  before_action :set_tour, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]

  # GET /tours or /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1 or /tours/1.json
  def show
    @user_buy_current_tour = user_signed_in? && current_user.tours.where(id: params[:id]).any?
  end

  # GET /tours/new
  def new
    @tour = Tour.new
    authorize @tour
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end

  # GET /tours/1/edit
  def edit
    authorize @tour
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end

  # POST /tours or /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to :admin_page, notice: "Тур был успешно создан." }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1 or /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to :admin_page, notice: "Тур был успешно обновлён." }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1 or /tours/1.json
  def destroy
    begin
      authorize @tour
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
      return
    end
    @tour.destroy!

    respond_to do |format|
      format.html { redirect_to tours_url, notice: "Тур был успешно удалён." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tour
    @tour = Tour.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tour_params
    params.require(:tour).permit(:name, :description, :country, :price, :rate)
  end
end
