# encoding: utf-8
class ArticleDecorator < Draper::Base
  decorates :article

  # Methods use in indexes
  def display
    h.content_tag(:div, :class => :article) do
      linked_title + description + more + h.clearer
    end
  end

  def linked_title
    h.content_tag(:h1, h.link_to(model.title, h.article_path(model)))
  end

  def description
    h.content_tag(:div, h.markdown(model.description), :class => :description)
  end


  def more
    if model.further?
      h.link_to("Lire la suite &raquo;".html_safe, h.article_path(model), class: "btn more_article")
    else
      ""
    end
  end

  # Methods use in show action
  def body
    h.content_tag(:div, h.markdown(model.body), class: :content)
  end

  def license
    h.content_tag(:div, class: "license") do
      h.link_to(h.image_tag(license_image_path), license_url) +
      h.content_tag(:p, license_information)
    end
  end

  def introduction
    h.content_tag(:div, model.introduction, class: :introduction) if model.introduction
  end

  def infos
    h.content_tag(:div, class: :infos) do
      h.raw(date + categories + edit_link)
    end
  end

  def date
    h.l(model.created_at, :format => :long).titlecase + " — "
  end

  def categories
    html = ""
    categories = model.categories

    categories.each do |category|
      html += category.name
      if category != categories.last
        html += ", "
      end
    end

    return html
  end

  def edit_link
    if h.can? :edit, model
      " — " + h.link_to("éditer cet article", h.edit_admin_article_path(model)).html_safe
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