# encoding: utf-8
ActiveAdmin.register Comment, :as => "Commentaires" do
  index do
    selectable_column
    column :id
    column "Contenu", :body
    column :author
    column "Date de création", :created_at
    default_actions
  end
end
