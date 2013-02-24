# encoding: utf-8
class ArticleDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all


  def display
    content_tag(:div, :class => :article) do
      linked_title + description + more + clearer
    end
  end

  def linked_title
    content_tag(:h1, link_to(title, article_path(source)))
  end

  def description
    content_tag(:div, markdown(source.description), :class => :description)
  end


  def more
    if source.further?
      link_to("Lire la suite &raquo;".html_safe, article_path(source), class: "btn more_article")
    else
      ""
    end
  end


  def body
    content_tag(:div, markdown(source.body), class: :content)
  end

  def license
    content_tag(:div, class: "license") do
      link_to(image_tag(license_image_path), license_url) +
      content_tag(:p, license_information)
    end
  end

  def introduction
    content_tag(:div, source.introduction, class: :introduction) if source.introduction
  end

  def infos
    content_tag(:div, class: :infos) do
      raw(date + categories + edit_link)
    end
  end

  def date
    l(created_at, :format => :long).titlecase + " — "
  end

  def categories
    html = ""

    source.categories.each do |category|
      html += category.name
      if category != source.categories.last
        html += ", "
      end
    end

    return html
  end

  def edit_link
    if can? :edit, source
      " — " + link_to("éditer cet article", edit_admin_article_path(source)).html_safe
    else
      ""
    end
  end

  private

    def license_image_path
      "http://i.creativecommons.org/l/by-nc-sa/2.0/fr/88x31.png"
    end

    def license_url
      "http://creativecommons.org/licenses/by-nc-sa/3.0/deed.fr"
    end

    def license_information
      raw("Cet article est mis à disposition selon les termes de la " + link_to("license Creative Commons Attribution (CC-BY-NC-SA)", license_url) + ".")
    end
end