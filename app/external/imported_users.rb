class ImportedUsers
  def initialize(file)
    @file = file
  end

  def save
    rows.each_with_index do |attrs, index|
      next if index == 0

      create_or_update_user attrs
    end
  end

  def rows
    Roo::Excelx.new(@file.path).sheet(0).parse(headers: true)
  end

  def create_or_update_user(attrs)
    user = User.find_or_initialize_by(email: attrs["email"])
    user.assign_attributes(
      name: attrs["name"],
      role: attrs["role"]
    )

    if user.new_record?
      user.password = user.password_confirmation = "secret123"
    end

    user.save!
  end
end
