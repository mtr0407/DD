class AddUrlToDemos < ActiveRecord::Migration[5.2]
  def change
    add_column :demos, :url, :string
    add_column :demos, :univercity_name, :string
    add_column :demos, :team_name, :string
    add_column :demos, :comment, :string
    
  end
end
