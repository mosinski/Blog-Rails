class AddKategoriaToArticles < ActiveRecord::Migration[4.2]
  def change
    add_column :articles, :kategoria, :string
  end
end
