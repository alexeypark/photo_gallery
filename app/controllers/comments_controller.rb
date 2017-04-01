class CommentsController < ApplicationController
  before_action :set_photo

  def index
    @comments = @photo.comments.order("created_at ASC")

    respond_to do |format|
      format.html { render layout: !request.xhr? }
    end
  end

  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went wrong."
      redirect_to :back
    end
  end

  def destroy
    @comment = @photo.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.delete
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :rate)
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end
end
