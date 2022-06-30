class ExportedUsers
  def initialize(role:, created_at_range:)
    @role = role
    @created_at_range = created_at_range
  end

  def as_xlsx
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(name: "Users") do |sheet|
      sheet.add_row ["email", "name", "role"]

      users.find_each do |user|
        sheet.add_row [user.email, user.name, user.role]
      end
    end

    p.to_stream.read
  end

  def users
    User.where(
      role: @role,
      created_at: @created_at_range
    )
  end

  def filename
    "users_#{@role}_#{@created_at_range.begin}_#{@created_at_range.end}.xlsx"
  end
end
