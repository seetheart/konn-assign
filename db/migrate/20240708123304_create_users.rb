class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, :limit => 255
      t.string :email, :limit => 255
      t.json :campaigns_list

      t.timestamps
    end
  end
end
