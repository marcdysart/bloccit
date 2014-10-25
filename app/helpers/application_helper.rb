 module ApplicationHelper
  #  def form_group_tag(errors, &block)
  #    if errors.any?
  #      content_tag :div, capture(&block), class: 'form-group has-error'
  #    else
  #      content_tag :div, capture(&block), class: 'form-group'
  #    end
  #  end

  def form_group(errors)
       if errors.any?
        error_class= "form-group has-error"
       else
        error_class= 'form-group'
       end
  end


 end


def my_name
    :'Marc Dysart'
end
