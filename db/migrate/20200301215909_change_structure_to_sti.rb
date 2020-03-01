class ChangeStructureToSti < ActiveRecord::Migration[5.2]
  def up
    drop_table :books
    drop_table :authors_books
    drop_table :magazines
    drop_table :authors_magazines

    create_table :publications do |t|
      t.string :title
      t.string :description
      t.string :isbn, index: true
      t.datetime :published_at
    end

    create_join_table :authors, :publications do |t|
      t.index [:author_id, :publication_id]
      t.index [:publication_id, :author_id]
    end
  end

  def down
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :isbn, index: true
    end

    create_join_table :authors, :books do |t|
      t.index [:author_id, :book_id]
      t.index [:book_id, :author_id]
    end

    create_table :magazines do |t|
      t.string :title
      t.datetime :published_at
      t.string :isbn
    end

    create_join_table :authors, :magazines do |t|
      t.index [:author_id, :magazine_id]
      t.index [:magazine_id, :author_id]
    end
  end
end
