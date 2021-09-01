require 'csv'

bom = "\uFEFF"
CSV.generate(bom) do |csv|
  csv_column_names = %w(Family_name Given_name Attendance Note)
  csv << csv_column_names
  @attendances.each do |attendance|
    csv_column_values = [
      attendance.member.family_name,
      attendance.member.given_name,
      attendance.attendance_status,
      attendance.note,
    ]
    csv << csv_column_values
  end
end
