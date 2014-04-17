class PoimanagesController < ApplicationController
  before_action :set_poimanage, only: [:show, :edit, :update, :destroy]

  # GET /poimanages
  # GET /poimanages.json
  def index
    @poimanages = Poimanage.all
    @hash = Gmaps4rails.build_markers(@poimanages) do |poimanage, marker|
      marker.lat poimanage.latitude
      marker.lng poimanage.longitude
      des = "Title: "+poimanage.title+"<br />"+ "Description: "+poimanage.description
      marker.infowindow des
      marker.json({title: poimanage.title })
    end
  end

  # GET /poimanages/1
  # GET /poimanages/1.json
  def show
  end

  # GET /poimanages/new
  def new
    @poimanage = Poimanage.new
  end

  # GET /poimanages/1/edit
  def edit
  end

  # POST /poimanages
  # POST /poimanages.json
  def create
    @poimanage = Poimanage.new(poimanage_params)

    respond_to do |format|
      if @poimanage.save
        format.html { redirect_to @poimanage, notice: 'Poimanage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @poimanage }
      else
        format.html { render action: 'new' }
        format.json { render json: @poimanage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poimanages/1
  # PATCH/PUT /poimanages/1.json
  def update
    respond_to do |format|
      if @poimanage.update(poimanage_params)
        format.html { redirect_to @poimanage, notice: 'Poimanage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @poimanage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poimanages/1
  # DELETE /poimanages/1.json
  def destroy
    @poimanage.destroy
    respond_to do |format|
      format.html { redirect_to poimanages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poimanage
      @poimanage = Poimanage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poimanage_params
      params.require(:poimanage).permit(:latitude, :longitude, :description, :title)
    end
end
