class Article < ActiveRecord::Base
  attr_accessible :body, :title,:kategoria

  validates_presence_of :title, :body,:kategoria
  validates_uniqueness_of :title

   has_many :comments, :dependent => :destroy
   

def self.search(search, page)
  paginate :per_page => 5, :page => page,
           :conditions => ['title like :q or body like :q or kategoria like :q', q: "%#{search}%"], :order => 'created_at DESC'
end

end
