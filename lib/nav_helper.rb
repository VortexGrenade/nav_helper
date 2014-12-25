require "nav_helper/version"

module NavigationHelper
  def current_path
    request.path
  end

  def current_path?(path, root = '/')
    if path == root
      current_path == path
    else
      (/\A#{path}(\/.*)?\Z/ =~ current_path).present?
    end
  end

  def nav_item(title, path = nil, options = nil, &blk)
    path, options = title, path if block_given?

    options ||= {}
    root = options.delete(:root)
    active_class = options.delete(:active_class) || 'active'
    wrapper = options.delete(:wrapper) || {}
    tag = wrapper.delete(:tag) || :li

    if current_path?(path, root)
      wrapper[:class] = [ wrapper[:class], active_class ].compact.join(' ')
    end

    content_tag(tag, wrapper) do
      if block_given?
        link_to(path, options, &blk)
      else
        link_to(title, path, options)
      end
    end
  end
end
