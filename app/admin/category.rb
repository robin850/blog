ActiveAdmin.register Category do
  
  index do
    selectable_column
    column :id
    column "Nom", :name
    column "Nombre d'articles" do |category|
      category.articles.count
    end
  end
  
end