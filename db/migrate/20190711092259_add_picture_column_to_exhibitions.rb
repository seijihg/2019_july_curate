class AddPictureColumnToExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions, :picture, :string
  end
end
