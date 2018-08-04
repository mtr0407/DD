class AddContentWithFrameToDemos < ActiveRecord::Migration[5.2]
  def change
    add_column :demos, :content_with_frame, :string
  end
end
