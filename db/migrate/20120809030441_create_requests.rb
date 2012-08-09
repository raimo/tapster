class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :body
      t.string :method
      t.string :fullpath

      t.timestamps
    end
  end
end
