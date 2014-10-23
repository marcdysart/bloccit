 module ApplicationHelper
   def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end

   def form_group(errors)
        if errors.any?
         @error_class='has-error'
        else
         @error_class=''
        end
   end

 end



# def markdown(text)
#   renderer = Redcarpet::Render::HTML.new
#   extensions = {fenced_code_blocks: true}
#   redcarpet = Redcarpet::Markdown.new(renderer, extensions)
#   (redcarpet.render text).html_safe
# end

def my_name
    :'Marc Dysart'
end
