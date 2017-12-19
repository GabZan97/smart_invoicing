module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Smart Invoicing"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  def errors_for(object)
    if object.errors.any?
        content_tag(:div, class: "card border-danger mb-3") do
          content_tag(:div, class: 'card-body text-danger', id: "error_explanation") do
              concat(content_tag(:h4, class: "card-title") do
                  concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
              end)
                concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
                    object.errors.full_messages.each do |msg|
                        concat content_tag(:li, msg, class: 'list-group-item')
                    end
                end)
            end
          end
      end
  end

end
