class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :status, default: 'PENDING'
      t.references :user, null: false, foreign_key: true
      t.references :toilet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
