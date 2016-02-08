class ArticlesTags < ActiveRecord::Migration
  def change
    create_table :articles_tags do |t|
      t.belongs_to :article, :tag
      t.timestamps
    end
  end
end
