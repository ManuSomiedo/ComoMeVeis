class DatetimeToTimestamps < ActiveRecord::Migration
  def change
    ALTER TABLE valorations DROP COLUMN date;
    ALTER TABLE valorations ADD COLUMN date timestamp;
  end
end
