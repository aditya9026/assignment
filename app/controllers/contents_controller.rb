class ContentsController < ApplicationController
  before_action :find_content, only: %i[show update destroy]

  def index
    @contents = Content.all
    render json:  { content: @contents, success: true }
  end

  def show
    @content = Content.find(params[:id])
    render json:  { content: @content }
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      render json:  { content: @content, success: true }
    else
      render json:  { content: @content, errors: @content.errors.full_messages, success: false }, status: :unprocessable_entity
    end
  end

  def update
    if @content.update(content_params)
      render json:  { content: @content, success: true }
    else
      render json:  { content: @content, errors: @content.errors.full_messages, success: false }, status: :unprocessable_entity
    end
  end

  def destroy
    if @content.destroy
      render json:  { content: @content, success: true }
    else
      render json:  { content: @content, errors: @content.errors.full_messages, success: false }, status: :unprocessable_entity
    end
  end

  private

  def find_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :body, :published)
  end
end