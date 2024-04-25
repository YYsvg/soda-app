class CreateOutcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :outcomes do |t|
      t.integer :price
      t.string :memo
      t.string :image

      t.references :outcome_category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
