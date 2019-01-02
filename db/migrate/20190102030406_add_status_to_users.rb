class AddStatusToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.string :status, limit: 25
    end

    users = select_all("SELECT id FROM users WHERE status IS NULL")

    users.each do |user|
      update <<-SQL
        UPDATE users
        SET status = 'admin'
        WHERE id = '#{user['id']}' and admin = 't' and locked = 'f' and active = 't'
      SQL
      update <<-SQL
        UPDATE users
        SET status = 'active'
        WHERE id = '#{user['id']}' and active = 't' and locked = 'f' and admin = 'f'
      SQL
      update <<-SQL
        UPDATE users
        SET status = 'inactive'
        WHERE id = '#{user['id']}' and active = 'f' and locked = 'f' and admin = 'f'
      SQL
      update <<-SQL
        UPDATE users
        SET status = 'locked'
        WHERE id = '#{user['id']}' and locked = 't'
      SQL
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :status
    end
  end
end
