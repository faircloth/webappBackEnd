class AddTagToArticle < ActiveRecord::Migration
  def up
    add_column :articles, :tag, :string
  end

  def down
    remove_column :articles, :tag
  end
end
