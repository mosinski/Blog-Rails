class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :kategoria
  validates_uniqueness_of :title

  has_one :visit, as: :visitable
  has_many :comments, dependent: :destroy

  def self.search(search, page)
    order(created_at: :desc).where('title like :q or body like :q or kategoria like :q', q: "%#{search}%").paginate(page: page, per_page: 5)
  end

  def previous_article
    self.class.order(created_at: :desc).where("created_at < ?", created_at).first
  end

  def next_article
    self.class.order(created_at: :asc).where("created_at > ?", created_at).first
  end

  def slug
    title.to_url.first(40)
  end

  def to_param
    "#{id}-#{slug}"
  end
end
