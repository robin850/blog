# encoding: utf-8
class ArticleDecorator < Draper::Decorator
  delegate_all


  def display
    h.content_tag(:div, :class => :article) do
      linked_title + description + more + h.clearer
    end
  end

  def linked_title
    h.content_tag(:h1, h.link_to(title, h.article_path(source)))
  end

  def description
    h.content_tag(:div, h.markdown(source.description), :class => :description)
  end


  def more
    if source.further?
      h.link_to("Lire la suite &raquo;".html_safe, h.article_path(source), class: "btn more_article")
    else
      ""
    end
  end


  def body
    h.content_tag(:div, h.markdown(source.body), class: :content)
  end

  def license
    h.content_tag(:div, class: "license") do
      h.link_to(h.image_tag(license_image_path), license_url) +
      h.content_tag(:p, license_information)
    end
  end

  def introduction
    h.content_tag(:div, source.introduction, class: :introduction) if source.introduction
  end

  def infos
    h.content_tag(:div, class: :infos) do
      h.raw(date + categories + edit_link)
    end
  end

  def date
    h.l(created_at, :format => :long).titlecase + " — "
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
    if h.can? :edit, source
      " — " + h.link_to("éditer cet article", h.edit_admin_article_path(source)).html_safe
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
      h.raw("Cet article est mis à disposition selon les termes de la " + h.link_to("license Creative Commons Attribution (CC-BY-NC-SA)", license_url) + ".")
    end
end