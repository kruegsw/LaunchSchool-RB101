def generate_uuid

  uuid = ""

  sections = [8, 4, 4, 4, 12]

  for section in sections
    section.times { |_| uuid << "abcdefghijklmnopqrstuvwxyz1233456789".chars.sample }
    uuid << "-" unless section == sections.last
  end

  uuid
end


p generate_uuid