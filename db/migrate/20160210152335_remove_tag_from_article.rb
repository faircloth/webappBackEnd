class RemoveTagFromArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :tag, :string
  end
end
