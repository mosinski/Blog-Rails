class AddIpToComments < ActiveRecord::Migration[4.2]
  def change
    add_column :comments, :ip, :string
  end
end
