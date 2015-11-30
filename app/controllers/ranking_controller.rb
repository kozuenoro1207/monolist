class RankingController < ApplicationController
  def want
    @rank_wants_id = Item.joins(:wants).group(:item_id).count(:user_id).sort_by{|k,v| v}.take(10).to_h.keys
    @rank_wants_item = Item.find(@rank_wants_id)

  end
  def have
    @rank_haves_id = Item.joins(:haves).group(:item_id).count(:user_id).sort_by{|k,v| v}.take(10).to_h.keys
    @rank_haves_item = Item.find(@rank_haves_id)
  end
end
