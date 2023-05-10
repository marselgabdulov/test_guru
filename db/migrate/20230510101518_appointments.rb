class Appointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :test_passage, index: true

      t.timestamps
    end
  end
end
