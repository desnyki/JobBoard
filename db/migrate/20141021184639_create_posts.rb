class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :email
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
