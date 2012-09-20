class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :article_id, :body, :email, :name

  validates_presence_of :name
   validates_length_of :name, :within => 2..20
   validates_presence_of :body
end
