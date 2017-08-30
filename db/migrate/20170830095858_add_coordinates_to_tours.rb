class AddCoordinatesToTours < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :latitude, :float
    add_column :tours, :longitude, :float
  end
end
