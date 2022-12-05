class CreateConcernsGlobalizeAccessors < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_globalize_accessors do |t|

      t.timestamps
    end
  end
end
