class CreateVods < ActiveRecord::Migration[8.0]
  def change
    create_table :vods do |t|
      t.string :title
      t.string :creator
      t.integer :start_year
      t.string :platform
      t.json :genre

      t.timestamps
    end
  end
end
