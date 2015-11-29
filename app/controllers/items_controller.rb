class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :search_index => 'All' , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      @amazon_items = response.items
    end
  end

  def show
    @item_haves_users = @item.haves_users
    @item_wants_users = @item.wants_users
  end
  def ranking_want
    @rank_wants_id = Item.joins(:wants).group(:item_id).count(:user_id).sort_by{|k,v| v}.take(10).to_h.keys
    @rank_wants_item = Item.find(@rank_wants_id)

  end
  def ranking_have
    @rank_haves_id = Item.joins(:haves).group(:item_id).count(:user_id).sort_by{|k,v| v}.take(10).to_h.keys
    @rank_haves_item = Item.find(@rank_haves_id)
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
