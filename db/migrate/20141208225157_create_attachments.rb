class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :url
      t.text :description
      t.references :task, index: true

      t.timestamps
    end
  end
end
