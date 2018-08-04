class AddImageNameToUnivercities < ActiveRecord::Migration[5.2]
  def change
    add_column :univercities, :image_name, :string
  end
end
