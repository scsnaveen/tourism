class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
    	t.string :place_name
    	t.string :place_description
    	t.references :country,null: false, foreign_key: true

      t.timestamps
    end
  end
end
