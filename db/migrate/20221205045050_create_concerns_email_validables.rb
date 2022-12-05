class CreateConcernsEmailValidables < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_email_validables do |t|

      t.timestamps
    end
  end
end
