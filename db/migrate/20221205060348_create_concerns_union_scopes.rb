class CreateConcernsUnionScopes < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_union_scopes do |t|

      t.timestamps
    end
  end
end
