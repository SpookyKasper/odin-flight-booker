class RemoveReferenceFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookings, :passenger, null: false, foreign_key: true
  end
end
