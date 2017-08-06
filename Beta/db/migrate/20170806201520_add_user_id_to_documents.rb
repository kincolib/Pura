class AddUserIdToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_reference :documents, :user, foreign_key: true
  end

  def self.down
  end
end
