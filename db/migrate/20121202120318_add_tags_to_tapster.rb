class AddTagsToTapster < ActiveRecord::Migration
  def change
    add_column :tapsters, :tags, :string
  end
end
