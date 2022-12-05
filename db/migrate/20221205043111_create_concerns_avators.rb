class CreateConcernsAvators < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_avators do |t|

      t.timestamps
    end
  end
end
