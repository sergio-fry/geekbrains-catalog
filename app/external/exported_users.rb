class ExportedUsers
  def initialize(users)
    @users = users
  end

  def as_xlsx
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(name: "Users") do |sheet|
      sheet.add_row ["email", "name", "role"]

      @users.find_each do |user|
        sheet.add_row [user.email, user.name, user.role]
      end
    end

    p.to_stream.read
  end
end
