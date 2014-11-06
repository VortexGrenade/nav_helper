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
    options.reverse_merge!(tag: :li, root: nil)

    tag = options.delete(:tag)
    is_active = current_path?(path, options.delete(:root))

    content_tag(tag, class: (:active if is_active)) do
      if block_given?
        link_to(path, options, &blk)
      else
        link_to(title, path, options)
      end
    end
  end
end
