class ContentsController < ApplicationController
  def index
    @contents = Content.all
    render json:  { content: @contents, success: true }
  end

  def show
    @content = Content.find(params[:id])
    render json:  { content: @content }
  end
end