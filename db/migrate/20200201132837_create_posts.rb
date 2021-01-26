class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :editory_id
      t.integer :county_id
      t.integer :user_id
      t.integer :blog_id
      t.string :title
      t.string :headline
      t.text :resume
      t.text :content
      t.string :image_copyright
      t.string :subtitle
      t.integer :position, default: 0
      t.string :source
      t.integer :status, default: 0
      t.string :slug
      t.datetime :published_at
      t.string :editor
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
