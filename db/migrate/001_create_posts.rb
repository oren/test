class CreatePosts < Sequel::Migration
  def up
    create_table :posts do
      primary_key :id
      String :name
      Text :body
      String :image
    end
  end

  def down
    drop_table :posts
  end
end
