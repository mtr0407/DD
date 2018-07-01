class CreateUnivercities < ActiveRecord::Migration[5.2]
  def change
    create_table :univercities do |t|
      t.string :name
      t.string :circle_name

      t.timestamps
    end
  end
end
