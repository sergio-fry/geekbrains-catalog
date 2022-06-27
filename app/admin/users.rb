ActiveAdmin.register User do
  menu priority: 2
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column "admin?", ->(resource) { resource.role == "admin" }
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :avatar, as: :file

      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end
end
