class CreateProtospaces < ActiveRecord::Migration[7.0]
  def change
    create_table :protospaces do |t|
      t.text :title
      t.text :catch_copy
      t.text :concept
      t.text :image
      t.timestamps
    end
  end
end
