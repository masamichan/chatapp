class CreateConcernsAuditableBeheviors < ActiveRecord::Migration[6.0]
  def change
    create_table :concerns_auditable_beheviors do |t|

      t.timestamps
    end
  end
end
