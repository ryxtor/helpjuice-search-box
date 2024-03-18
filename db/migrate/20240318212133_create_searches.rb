class CreateSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :searches do |t|
      t.references :user, foreign_key: true
      t.string :query, index: true

      t.timestamps
    end

    add_index :searches, %i[user_id updated_at]
  end
end
