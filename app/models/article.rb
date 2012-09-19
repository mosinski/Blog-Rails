class Article < ActiveRecord::Base
  attr_accessible :body, :title,:kategoria

  validates_presence_of :title, :body,:kategoria
  validates_uniqueness_of :title

   has_many :comments, :dependent => :destroy
end
