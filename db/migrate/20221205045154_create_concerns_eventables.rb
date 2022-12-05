class CreateConcernsEventables < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_eventables do |t|

      t.timestamps
    end
  end
end
