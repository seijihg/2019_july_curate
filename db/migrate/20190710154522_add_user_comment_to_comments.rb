class AddUserCommentToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :user_comment, :string
  end
end
