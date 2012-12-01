class CreateTapsters < ActiveRecord::Migration
  def change
    create_table :tapsters do |t|
      t.string :identifier
      t.string :question
      t.integer :user_id

      t.timestamps
    end
  end
end
