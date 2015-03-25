module LinkWithIcon

  def self.link_with_icon(icon_class = nil, name = nil, options = nil, html_options = nil, &block)
    link_to("#{ icon(icon_class) }#{ name }".html_safe, options, html_options, &block)
  end

  private

  def icon(icon_class)
    "<i class='icon-#{ icon_class }'></i>"
  end
end
ActionView::Base.send(:include, LinkWithIcon) if defined?(ActionView::Base)
