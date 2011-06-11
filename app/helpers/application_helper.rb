module ApplicationHelper
  
  def error_messages_for(*objects)
    options = objects.extract_options!
    options[:header_message] ||= "Invalid Fields"
    options[:message] ||= "Correct the following errors and try again."
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten
    unless messages.empty?
      content_tag(:div, :class => 'error_messages') do
        list_items = messages.map { |msg| content_tag(:li, msg) }
        messages_list = (options[:list_messages] == false) ? '' : content_tag(:ul, list_items.join.html_safe)
        content_tag(:h2, options[:header_message]) +
        content_tag(:p, options[:message]) +
        messages_list
      end
    end
  end
  
  def flash_messages(options = {})
    ret = []
    flash.each do |key, value|
      ret << content_tag(:p, value, :class => "#{key}", :id => "flash-#{key}")
    end
    return ret.join("\n")
  end
  
end
