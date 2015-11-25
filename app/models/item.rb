class Item < ActiveRecord::Base
  serialize :raw_info , Hash

  has_many :ownerships  , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships
  
  has_many :wants ,class_name:"Favorite", foreign_key:"item_id",dependent: :destroy
  has_many :wants_users, through: :wants, source: :user
  
  has_many :haves ,class_name:"Favorite", foreign_key:"item_id",dependent: :destroy
  has_many :haves_users, through: :haves, source: :user
end
