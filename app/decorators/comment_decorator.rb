# encoding: utf-8
class CommentDecorator < Draper::Decorator
  delegate_all

  def display
    klass = (admin?) ? "comment admin" : "comment"

    h.content_tag(:div, class: klass) do
      avatar + content
    end
  end

  private

    def avatar
      h.content_tag(:div, class: :avatar) do
        h.image_tag(h.avatar_url(source, 66)) +
        h.content_tag(:span, "", class: "avatar-overlay")
      end
    end

    def content
      h.content_tag(:div, class: :content) do
        infos + edit_action + body
      end
    end

    def published_at
      h.l(created_at, :format => :long)
    end

    def infos
      h.content_tag(:div, class: :info) do
        h.content_tag(:span, author, class: :username) + " — " +
        h.content_tag(:span, published_at, class: :date)
      end
    end

    def edit_action
      if h.can? :edit, Comment
        h.link_to "Modifier", h.edit_article_comment_path(article, source)
      end
    end

    def body
      h.markdown(source.body, true)
    end

end