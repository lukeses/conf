class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :form
      t.decimal :amount
      t.text :description
      t.references :event, index: true

      t.timestamps
    end
  end
end
