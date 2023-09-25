class AddUserIdToProtospaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :protospaces, :user, null: false, foreign_key: true
  end
end
