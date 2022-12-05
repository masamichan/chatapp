class CreateConcernsConnectivities < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_connectivities do |t|

      t.timestamps
    end
  end
end
