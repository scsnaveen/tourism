class CreateConversionRates < ActiveRecord::Migration[6.1]
  def change
    create_table :conversion_rates do |t|
    	t.string :currency_code
    	t.decimal :conversion_rate,:precision => 32, :scale => 16

      t.timestamps
    end
  end
end
