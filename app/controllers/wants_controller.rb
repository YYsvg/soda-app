class WantsController < ApplicationController
  before_action :authenticate
  
  def index
    @wants = Want.all
  end

  def new
    @want = current_user.wants.new
  end

  def create
    @want = current_user.wants.new(want_params)
    @want.save
    redirect_to @want
  end

  def show
    @want = Want.find(params[:id])
  end

  def destroy
    @want = Want.find(params[:id])
    @want.destroy
    redirect_to wants_path, notice:"削除しますか？"
  end

  def edit
    @want = Want.find(params[:id])
  end

  def update
    @want = Want.find(params[:id])
    if @want.update(want_params)
      redirect_to wants_path, notice:"編集しますか？"
    else
      render 'edit'
    end
  end

  private

  def want_params
    params.require(:want).permit(:memo, :image, :user_id)
  end
end
