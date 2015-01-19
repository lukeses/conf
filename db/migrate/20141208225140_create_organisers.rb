class CreateOrganisers < ActiveRecord::Migration
  def change
    create_table :organisers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :skype
      t.text :description
      t.references :event, index: true

      t.timestamps
    end
  end
end
