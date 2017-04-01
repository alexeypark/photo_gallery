ActiveAdmin.register Photo do

  permit_params :title, :image, :user

  index do
    column :user
    column :title
    column :image do |ad|
      image_tag ad.image.url(:thumb)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :image
    end
    f.actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
end