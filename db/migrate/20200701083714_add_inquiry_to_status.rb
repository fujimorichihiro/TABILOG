class AddInquiryToStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :status, :integer
  end
end
