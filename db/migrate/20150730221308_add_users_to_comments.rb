class AddUsersToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    t.string :username
    t.string :password_digest
    # what do lines 4 and 5 do here?
  end
end
