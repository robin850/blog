# encoding: utf-8
class CommentDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def display
    klass = (admin?) ? "comment admin" : "comment"

    content_tag(:div, class: klass) do
      avatar + content
    end
  end

  private

    def avatar
      content_tag(:div, class: :avatar) do
        image_tag(h.avatar_url(source, 66)) +
        content_tag(:span, "", class: "avatar-overlay")
      end
    end

    def content
      content_tag(:div, class: :content) do
        infos + edit_action + body
      end
    end

    def published_at
      l(created_at, :format => :long)
    end

    def infos
      content_tag(:div, class: :info) do
        content_tag(:span, author, class: :username) + " — " +
        content_tag(:span, published_at, class: :date)
      end
    end

    def edit_action
      if can? :edit, Comment
        link_to "Modifier", edit_article_comment_path(article, source)
      end
    end

    def body
      markdown(source.body, true)
    end

end
