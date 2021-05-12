class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
    	t.string :package_places,array: true, default: []
    	t.decimal :price,:precision => 32, :scale => 16

      t.timestamps
    end
  end
end
