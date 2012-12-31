# encoding: utf-8
require 'pygments'
require 'redcarpet/compat'
require 'nokogiri'

module ApplicationHelper

  def syntax_highlight(html)
    doc = Nokogiri::HTML(html)

    doc.search("//code[@class]").each do |code|
      begin
        code.replace Pygments.highlight(code.text.rstrip, :lexer => code[:class])
      rescue MentosError
        code.replace Pygments.highlight(code.text.rstrip)
      end
      doc.search(".highlight").last["class"] = "highlight " + code[:class]
    end
    
    doc.to_s
  end

  def clearer
    content_tag(:div, "", style: "clear:both")
  end


  def markdown(markdown, filter_html = false)
    md_options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode, :tables]
    md_options.push(:filter_html) if filter_html

    html = Markdown.new(markdown, *md_options).to_html
    syntax_highlight(html).html_safe
  end


  def avatar_url(user, size = 100)
    gravatar_md5 = Digest::MD5.hexdigest(user.email)
    "http://gravatar.com/avatar/#{gravatar_md5}.png?&s=#{size}"
  end

  def title(title)
    content_for(:title) { title }
  end


  def show_or_index?
    return ["show", "index"].include?(params[:action])
  end

  def grid_size
    show_or_index? ? 8 : 12
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
end
