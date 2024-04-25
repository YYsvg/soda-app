class CreateWants < ActiveRecord::Migration[5.2]
  def change
    create_table :wants do |t|
      t.string :memo
      t.string :image
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
