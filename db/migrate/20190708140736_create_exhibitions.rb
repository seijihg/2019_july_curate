class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.string :artist
      t.string :category
      t.string :gallery
      t.string :location
      t.date :date_end
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
