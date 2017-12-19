module SelectDateHelper
  def select_date(date, options = {})
    field = options[:from]
    base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
    year, month, day = date.split(',')
    select year,  :from => "#{base_id}_1i"
    select month, :from => "#{base_id}_2i"
    select day,   :from => "#{base_id}_3i"
  end
  def select_time(date, options = {})
    field = options[:from]
    base_id = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
    hour, minute, second = hour.split(':')
    select hour, :from => "#{base_id}_1i"
    select minute, :from => "#{base_id}_2i"
  end
end
