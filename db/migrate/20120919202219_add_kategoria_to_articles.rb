class AddKategoriaToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :kategoria, :string
  end
end
