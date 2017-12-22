class RenameTitleToName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :assignments, :title, :name
  end
end
