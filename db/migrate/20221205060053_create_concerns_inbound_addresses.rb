class CreateConcernsInboundAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_inbound_addresses do |t|

      t.timestamps
    end
  end
end
