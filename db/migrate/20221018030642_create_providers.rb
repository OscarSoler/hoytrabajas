class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :nit
      t.string :name_contact
      t.string :phone_contact
      t.string :account_number
      t.references :bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
