class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :buildingType
      t.integer :nbrAppBuild
      t.integer :nbrFloorsR
      t.integer :nbrFloorsC
      t.integer :nbrFloorsCor
      t.integer :nbrFloorsH
      t.integer :nbrBasementFloorsR
      t.integer :nbrBasementFloorsC
      t.integer :nbrBasementFloorsCor
      t.integer :nbrBasementFloorsH
      t.integer :nbrDisBuiCor
      t.integer :nbrDisBuiH
      t.integer :nbrParkingC
      t.integer :nbrParkingCor
      t.integer :nbrParkingH
      t.integer :nbrElevatorCages
      t.integer :nbrOccPerFloorCor
      t.integer :nbrOccPerFloorH
      t.integer :nbrActPerDay
      t.string :serviceType

      t.timestamps
    end
  end
end
