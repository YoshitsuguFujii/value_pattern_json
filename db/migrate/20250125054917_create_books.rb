class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :publish_year
      t.string :publisher
      t.json :genre

      t.timestamps
    end
  end
end
