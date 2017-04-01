class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy]
    before_action :set_photo, only: [:show, :destroy, :owned_post]
    before_action :owned_photo, only: [:destroy]

    def index
      @photos = Photo.all.order('created_at DESC')
    end

    def new
      authorize! :create, Photo
      @photo = current_user.photos.build
    end

    def create
      authorize! :create, Photo
      @photo = current_user.photos.build(photos_params)

      if @photo.save
        flash[:success] = "Your post has been created!"
        redirect_to photos_path
      else
        flash[:alert] = "Your new post couldn't be created!  Please check the form."
        render :new
      end
    end

    def show
      @comments = @photo.comments.order("created_at DESC")
    end

    def destroy
      authorize! :destroy, @photo
      @photo.destroy
      redirect_to photos_path
    end

    private

    def photos_params
      params.require(:photo).permit(:image, :title)
    end

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def owned_photo
      unless current_user == @photo.user
        flash[:alert] = "That photo doesn't belong to you!"
        redirect_to root_path
      end
    end
end
