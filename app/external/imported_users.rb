class ImportedUsers
  def initialize(file)
    @file = file
  end

  def save
    xlsx = Roo::Excelx.new(@file.path)
    xlsx.sheet(0).parse(headers: true).each_with_index do |attrs, index|
      next if index == 0

      user = User.find_or_initialize_by(email: attrs["email"])
      user.assign_attributes(
        name: attrs["name"],
        role: attrs["role"]
      )

      user.save!
    end
  end
end
