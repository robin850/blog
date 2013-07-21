# encoding: utf-8
require 'pygments'
require 'redcarpet/compat'

module ApplicationHelper
  class HTMLWithPygments < Redcarpet::Render::HTML
    def block_code(code, lang)
      begin
        Pygments.highlight(code, lexer: lang)
      rescue MentosError
        content_tag(:div, class: :highlight) do
          content_tag(:pre, code)
        end
      end
    end
  end

  def markdown(markdown, filter_html = false)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true
    }

    renderer = HTMLWithPygments.new(hard_wrap: true, filter_html: filter_html)
    Redcarpet::Markdown.new(renderer, options).render(markdown).html_safe
  end

  def avatar_url(user, size = 100)
    gravatar_md5 = Digest::MD5.hexdigest(user.email)
    "http://gravatar.com/avatar/#{gravatar_md5}.png?&s=#{size}"
  end

  def title(title)
    content_for(:title) { title }
  end

  def show_or_index?
    ["show", "index"].include?(params[:action])
  end

  def contact?
    params[:action] == "contact"
  end

  def grid_size
    show_or_index? || contact? ? 8 : 12
  end

  def main_grid(&block)
    content_tag(:div, :class => "grid_#{grid_size}") do
      yield
    end
  end

  def twitter_path
    "https://twitter.com/robin850"
  end

  def github_path
    "https://github.com/robin850"
  end

  def google_plus_path
    "https://plus.google.com/108745634161449276307"
  end

  def source_path
    github_path + "/blog"
  end

  def contact_class
    (params[:action] == "contact") ? "active" : ""
  end

  def blog_class
    (["articles", "categories"].include?(params[:controller])) ? "active " : ""
  end
end
