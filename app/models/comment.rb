class Comment < ActiveRecord::Base
  belongs_to :article

  validates :name, :body, presence: true
  validates_length_of :name, within: 2..20
end
