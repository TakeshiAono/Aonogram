class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]

  def index
    @pictures = Picture.all
  end

  def show
    @favorite = Favorite.new
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def edit
    byebug
      redirect_to pictures_path, notice: "投稿者ではないため編集できません"  unless session[:user_id] == Picture.find_by(id: params[:id])[:user_id]
  end

  def favorite
    Favorite.create(picture_id: params[:id], user_id: session[:user_id])
    redirect_to pictures_path
  end

  def confirm
    @picture = Picture.new(picture_params)
  end
  
  def create
    @picture = Picture.new(picture_params)
    @picture[:user_id] = session[:user_id]    
    if @picture.save
      SendReportMailer.picture_upload_report(User.find(session[:user_id])).deliver
      redirect_to pictures_path
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to picture_url(@picture), notice: "Picture was successfully updated." }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "Picture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private    
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit( :image, :coment, :image_cache)
  end
end
