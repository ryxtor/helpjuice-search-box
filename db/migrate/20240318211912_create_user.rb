class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :ip_address, index: true

      t.timestamps
    end
  end
end
