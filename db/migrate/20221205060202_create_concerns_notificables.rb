class CreateConcernsNotificables < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_notificables do |t|

      t.timestamps
    end
  end
end
