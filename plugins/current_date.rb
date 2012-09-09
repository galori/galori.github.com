module Jekyll
  class CurrentDate < Liquid::Tag
    def render(context)
      Time.now.strftime("%b %d, %Y")
    end
  end
end

Liquid::Template.register_tag('current_date', Jekyll::CurrentDate)
