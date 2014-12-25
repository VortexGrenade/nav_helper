# NavHelper

Helper for building nav links.

By default, helper generates link, wrapped with `<li>` and sets class "active", if link path is path of the current page.
```html
<ul>
  <%= nav_item('Home', '/') %>
  <%= nav_item('Contacts', '/contacts') %>
  <%= nav_item('About', '/about') %>
</ul>
```

Also, you can customize wrapper, active class and navigation root path:
```html
<div class="nav">
  <%= nav_item('Posts', admin_posts_path, active_class: 'activated' wrapper:{tag: :div, class: list-item}, root: admin_path) %>
  <%= nav_item('Users', admin_users_path, active_class: 'activated' wrapper:{tag: :div, class: list-item}, root: admin_path) %>
</div>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nav_helper'
```

## License

Copyright (c) 2014 Okhlopkov Anatoly

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
