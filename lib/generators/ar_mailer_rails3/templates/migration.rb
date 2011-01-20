class Create<%= migration_class_name.gsub(/::/, '') %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.column :from, :string
      t.column :to, :string
      t.column :last_send_attempt, :integer, :default => 0
      t.column :mail, :text
      t.column :created_on, :datetime
      t.column :created_at, :datetime
      t.column :sent_at, :datetime
      t.column :fatal_failure_at, :datetime
    end
    
    add_index :<%= table_name %>, [:sent_at, :last_send_attempt,:fatal_failure_at]
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
