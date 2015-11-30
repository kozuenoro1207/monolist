class RankingController < ApplicationController
  def want
    @rank_wants_id = Item.joins(:wants).group(:item_id).order('count_item_id desc').count(:item_id).keys.take(10)
    @rank_wants_item = Item.find(@rank_wants_id).index_by(&:id).slice(*@rank_wants_id).values

  end
  def have
    @rank_haves_id = Item.joins(:haves).group(:item_id).order('count_item_id desc').count(:item_id).keys.take(10)
    @rank_haves_item = Item.find(@rank_haves_id).index_by(&:id).slice(*@rank_haves_id).values
  end
end
