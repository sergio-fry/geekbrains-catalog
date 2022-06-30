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

  member_action :block, method: :post do
    # user.block!
    redirect_to resource_path(resource), notice: "Locked!"
  end
  action_item :block, only: :show do
    if false # resource.blocked?
      link_to "Unblock", url_for(action: :block), method: :post
    else
      link_to "Block", url_for(action: :block), method: :post
    end
  end

  collection_action :import_csv, method: [:get, :post] do
    # Do some CSV importing work here...
    if request.post?
      # TODO Import
      redirect_to collection_path, notice: "CSV imported successfully!"
    else
      render :import_form
    end
  end

  collection_action :import_csv, method: [:get, :post] do
    # Do some CSV importing work here...
    if request.post?
      # TODO Import
      redirect_to collection_path, notice: "CSV imported successfully!"
    else
      render :import_form
    end
  end
  action_item :import, only: :index do
    link_to "Import", url_for(action: :import_csv)
  end

  collection_action :export_xlsx, method: [:get, :post] do
    if request.post?
      send_data ExportedUsers.new(User.where(role: params[:role])).as_xlsx, filename: "users.xlsx"
    else
      render :export_form
    end
  end

  action_item :export, only: :index do
    link_to "Export", url_for(action: :export_xlsx)
  end

  csv do
    column :id
    column :email
    column :role
    column :admin, ->(user) { user.role == "admin" }
  end
end
