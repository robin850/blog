# encoding: utf-8
class ArticleDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def display
    div(:article) do
      linked_title + main_infos + description + more
    end
  end

  def linked_title
    link = link_to(title, article_path(model))
    content_tag(:h1, link)
  end

  def description
    div(:description) do
      markdown(model.description)
    end
  end

  def more
    if model.further?
      link_to("Lire la suite &raquo;".html_safe, article_path(model), class: "btn more")
    else
      ""
    end
  end

  def body
    div(:content) do
      markdown(model.body)
    end
  end

  def license
    div(:license) do
      link_to(image_tag(license_image_path), license_url) +
      content_tag(:p, license_information)
    end
  end

  def introduction
    div(:introduction) do
      markdown(model.introduction)
    end if model.introduction
  end

  def infos
    div(:infos) do
      raw(date + categories + edit_link)
    end
  end

  def date
    l(created_at, format: :long).titlecase + " — "
  end

  def categories
    html = ""

    model.categories.each do |category|
      html += link_to(category.name, category_path(category))
      if category != model.categories.last
        html += ", "
      end
    end

    return html.html_safe
  end

  def edit_link
    if can? :edit, model
      " — " + link_to("éditer cet article", edit_admin_article_path(model)).html_safe
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

    def main_infos
      div("article-infos") do
        date_info + comments_info + categories_info
      end + div(:clearer)
    end

    def date_info
      div(:date) do
        image_tag("date.svg") +
        l(model.created_at, :format => :date)
      end
    end

    def comments_info
      if model.commentable?
        div("comments-info") do
          target_text = pluralize(model.comments.count, "commentaire")

          image_tag("comments.svg") +
          link_to(target_text, article_path(model), :anchor => "comments")
        end
      else
        ""
      end
    end

    def categories_info
      div("categories-info") do
        image_tag("tags.svg") + self.categories
      end
    end
end
