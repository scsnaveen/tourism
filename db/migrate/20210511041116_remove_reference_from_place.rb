class RemoveReferenceFromPlace < ActiveRecord::Migration[6.1]
  def change
  	    remove_reference :places, :country, foreign_key: true
  	    add_column :places,:country,:string
  end
end
