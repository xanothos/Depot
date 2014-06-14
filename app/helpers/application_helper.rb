module ApplicationHelper
  def hidden_div_if(condition, options = {}, &block)
    if condition
      options["style"] = "display: none"
    end
    content_tag 'div', options, &block
  end
end
