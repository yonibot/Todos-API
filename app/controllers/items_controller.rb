class ItemsController < AuthController
  before_action :authenticate_from_token, only: [:create, :update]

  def create
    item = Item.new(item_params)
    item.user = current_user
    if item.save
      render json: {item: item}
    else
      render json: {error: item.errors.full_messages}, status: 422
    end
  end

  def update
    item = Item.where(id: item_params[:id]).first
    if item.update(item_params)
      render json: {item: item}
    else
      render json: {error: item.errors.full_messages}, status: 422
    end
  end

  def destroy
    item = Item.where(id: item_params[:id]).first
    if item.destroy
      render json: {}
    else
      render json: {error: item.errors.full_messages}, status: 422
    end
  end



  def index
    if current_user
      render json: {items: current_user.items}, status: 200
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :content, :completed)
  end


end
