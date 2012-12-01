class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :text
      t.integer :tapster_id
      t.integer :position

      t.timestamps
    end
  end
end
