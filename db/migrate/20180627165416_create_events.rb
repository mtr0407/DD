class CreateEvents < ActiveRecord::Migration[4.2]
  def self.up
    create_table :events do |t|
      t.integer   :user_id,   :null => false # 追加
      t.string    :name,      :null => false
      t.datetime  :start_at,  :null => false
      t.datetime  :end_at,    :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

