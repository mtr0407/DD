class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :univercity, foreign_key: true

      t.timestamps
    end
    
    add_index :teams, [:univercity_id, :created_at]
  end
end