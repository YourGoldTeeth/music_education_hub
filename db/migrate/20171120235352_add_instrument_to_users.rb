class AddInstrumentToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :instrument_id, :integer
    add_column :users, :secondary_instrument_id, :integer
  end
end
