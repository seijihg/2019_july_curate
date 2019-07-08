class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :exhibition, foreign_key: true

      t.timestamps
    end
  end
end
