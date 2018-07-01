class CreateDemos < ActiveRecord::Migration[5.2]
  def change
    create_table :demos do |t|
      t.string :name
      t.references :univercity, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
    
    add_index :demos, [:team_id, :created_at]
    add_index :demos, [:univercity_id, :created_at]
  end
end