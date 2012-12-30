# encoding: utf-8
ActiveAdmin.register Article do

  index do
    selectable_column
    column :id
    column :title
    column "Date de création", :created_at
    default_actions
  end

  form do |f|
    f.inputs "Détails" do
      f.input :title
      f.input :slug
      f.input :description
      f.input :introduction
    end

    f.inputs "Contenu" do
      f.input :body
    end

    f.inputs "Ordering" do
      f.input :categories, :as => :check_boxes
      f.input :published, :collection => [["Oui", :on], ["Non", :off]], :as => :radio
    end

    f.actions

  end

end