class AddPostedByGuestToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :posted_by_guest, :boolean, default: false
  end
end
