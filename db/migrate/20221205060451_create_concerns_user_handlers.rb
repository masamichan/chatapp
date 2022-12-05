class CreateConcernsUserHandlers < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_user_handlers do |t|

      t.timestamps
    end
  end
end
