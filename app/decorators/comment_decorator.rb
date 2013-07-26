# encoding: utf-8
class CommentDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def display
    klass = (admin?) ? "comment admin" : "comment"

    div(klass) do
      avatar + content
    end
  end

  private

    def avatar
      div(:avatar) do
        image_tag(h.avatar_url(model, 66)) +
        content_tag(:span, "", class: "avatar-overlay")
      end
    end

    def content
      div(:content) do
        infos + edit_action + body
      end
    end

    def published_at
      l(created_at, format: :long)
    end

    def infos
      div(:info) do
        content_tag(:span, author, class: :username) + " — " +
        content_tag(:span, published_at, class: :date)
      end
    end

    def edit_action
      if can? :edit, Comment
        link_to "Modifier", edit_article_comment_path(article, model)
      end
    end

    def body
      markdown(model.body, true)
    end
end
