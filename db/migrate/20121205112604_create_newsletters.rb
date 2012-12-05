class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :email
      t.string :kod_dostepu

      t.timestamps
    end
  end
end
