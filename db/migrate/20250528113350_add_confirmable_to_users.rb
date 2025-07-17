class AddConfirmableToUsers < ActiveRecord::Migration[8.0]
  def up
    # Only add columns if they don't exist
    add_column :users, :confirmation_token, :string unless column_exists?(:users, :confirmation_token)
    add_column :users, :confirmed_at, :datetime unless column_exists?(:users, :confirmed_at)
    add_column :users, :confirmation_sent_at, :datetime unless column_exists?(:users, :confirmation_sent_at)
    add_column :users, :unconfirmed_email, :string unless column_exists?(:users, :unconfirmed_email)
  end

  def down
    # Remove columns if they exist
    remove_column :users, :confirmation_token if column_exists?(:users, :confirmation_token)
    remove_column :users, :confirmed_at if column_exists?(:users, :confirmed_at)
    remove_column :users, :confirmation_sent_at if column_exists?(:users, :confirmation_sent_at)
    remove_column :users, :unconfirmed_email if column_exists?(:users, :unconfirmed_email)
  end
end