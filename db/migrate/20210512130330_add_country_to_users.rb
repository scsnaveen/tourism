class AddCountryToUsers < ActiveRecord::Migration[6.1]
  def change
  	add_column :users,:country,:string
  	add_column :users,:state,:string
  end
end
