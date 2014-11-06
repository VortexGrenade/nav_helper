require 'spec_helper'
require 'nav_helper'

describe NavigationHelper, type: [:helper] do
  before { helper.request.path = '/foo/bar' }

  describe '#current_path?' do
    it 'checks whether given path is the page path or path to a sub-page' do
      expect(helper.current_path?('/foo')).to be true
      expect(helper.current_path?('/foo/bar')).to be true

      expect(helper.current_path?('/fo')).to be false
      expect(helper.current_path?('/bar/baz')).to be false
      expect(helper.current_path?('/foo/bar/baz')).to be false
    end

    context 'root' do
      before { helper.request.path = '/foo' }

      it 'checks whether given path is the page path' do
        expect(helper.current_path?('/foo', '/foo')).to be true
        expect(helper.current_path?('/foo/bar', '/foo')).to be false

        expect(helper.current_path?('/fo', '/foo')).to be false
        expect(helper.current_path?('/bar', '/foo')).to be false
      end
    end
  end

  describe '#nav_item' do
    it 'generates nav item' do
      expect(helper.nav_item('Foo', '/fo')).to eq(%{<li><a href="/fo">Foo</a></li>})
      expect(helper.nav_item('Bar', '/foo/bar')).to eq(%{<li class="active"><a href="/foo/bar">Bar</a></li>})
    end

    it 'allows custom root' do
      helper.request.path = '/admin/foo/bar'

      expect(helper.nav_item('Foo', '/admin/fo', root: '/admin')).to eq(%{<li><a href="/admin/fo">Foo</a></li>})
      expect(helper.nav_item('Bar', '/admin/foo/bar', root: '/admin')).to eq(%{<li class="active"><a href="/admin/foo/bar">Bar</a></li>})
      expect(helper.nav_item('Bar', '/admin', root: '/admin')).to eq(%{<li><a href="/admin">Bar</a></li>})
    end

    it 'generates nav item with block' do
      expect(helper.nav_item('/fo') do
        'FOO'
      end).to eq "<li><a href=\"/fo\">FOO</a></li>"

      expect(helper.nav_item('/foo/bar') do
        'BAR'
      end).to eq "<li class=\"active\"><a href=\"/foo/bar\">BAR</a></li>"
    end
  end
end
