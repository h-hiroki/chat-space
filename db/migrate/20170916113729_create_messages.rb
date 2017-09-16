class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :group, index: true, null: false, foreign_key: true
      t.string :body
      t.string :image
      t.timestamps
    end
  end
end
