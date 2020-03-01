class CreateMagazines < ActiveRecord::Migration[5.2]
  def change
    create_table :magazines do |t|
      t.string :title
      t.datetime :published_at
      t.string :isbn
    end
  end
end
