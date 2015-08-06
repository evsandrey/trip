class AddProofIdToTrophies < ActiveRecord::Migration
  def change
    add_column :trophies, :proof_id, :integer
  end
end
