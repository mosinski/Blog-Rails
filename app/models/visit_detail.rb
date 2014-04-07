class VisitDetail < ActiveRecord::Base
  attr_accessible :ip_address
  belongs_to :visit
end
