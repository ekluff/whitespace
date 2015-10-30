class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_admin!, :except => [:show, :index]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
    @locations = Image.tag_counts_on(:locations) # returns all tags with context location
    @contents = Image.tag_counts_on(:contents)
    @keywords = Image.tag_counts_on(:keywords)
  end

  # GET /images/1/edit
  def edit
    @locations = Image.tag_counts_on(:locations)
    @contents = Image.tag_counts_on(:contents)
    @keywords = Image.tag_counts_on(:keywords)
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @location = image_params[:location]

    respond_to do |format|
      if @location
        format.js { render :new_tag }
      elsif @image.save
        @image.location_list = image_params[:location_list]
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    @location = image_params[:location]

    respond_to do |format|
      if @location
        format.js { render :new_tag }
      elsif @image.update(image_params)
        @image.location_list = image_params[:location_list]
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end

    # @image.asset = asset unless @image.asset != nil
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    # deletes attached image asset
    @image.asset = nil
    @image.save

    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:caption, :title, :asset, :splash, :location, :location_list)
  end
end
