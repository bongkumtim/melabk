class AddPictureToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :picture, :string
  end
end
