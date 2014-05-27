class VisitDetail < ActiveRecord::Base
  attr_accessible :visit_id, :ip_address
  belongs_to :visit
end
