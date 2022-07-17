class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.string :word
      t.string :translation
      t.boolean :learned

      t.timestamps
    end
  end
end
