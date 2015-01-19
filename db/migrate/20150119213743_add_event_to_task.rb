class AddEventToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :event, index: true
  end
end
