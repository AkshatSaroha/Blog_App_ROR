class AddUserToBlogPosts < ActiveRecord::Migration[7.2]
  # def change
  #   add_reference :blog_posts, :user, null: false, foreign_key: true
  # end

  def up
    add_reference :blog_posts, :user, foreign_key: true

    # Set a default user for existing records
    default_user = User.first
    BlogPost.update_all(user_id: default_user.id) if default_user

    change_column_null :blog_posts, :user_id, false
  end

  def down
    remove_reference :blog_posts, :user
  end
end
