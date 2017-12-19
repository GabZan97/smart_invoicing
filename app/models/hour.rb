class Hour < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :invoice, optional: true

  validates_presence_of :date, :start_time, :end_time, :user_id, :client_id
  validate :start_must_be_before_end_time
  validate :end_must_be_after_start_time
  validate :hour_date_and_time_must_be_before_now


  def start_must_be_before_end_time
    errors.add(:start_time, "must be before end time") unless start_time < end_time
  end
  def end_must_be_after_start_time
    errors.add(:end_time, "must be after start time") unless end_time > start_time
  end

  def hour_date_and_time_must_be_before_now
    if date.present? && date > Date.current
      errors.add(:date, "can't be in the future")
    end
    if date >= Date.current && end_time.to_s(:time) > (Time.current+1.hour).to_s(:time)
      errors.add(:end_time, "can't be in the future")
    end
  end
end
