require 'csv'

bom = "\uFEFF"
CSV.generate(bom) do |csv|
  csv_column_names = %w(姓 名 出欠状況 備考)
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
