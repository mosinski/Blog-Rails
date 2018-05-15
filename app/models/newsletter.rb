class Newsletter < ActiveRecord::Base
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    on: :create,
    message: 'ma nie poprawny format adresu.'
  }
end
