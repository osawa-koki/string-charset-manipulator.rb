# frozen_string_literal: true

require 'nkf'

paths = [
  './data/utf8.txt',
  './data/sjis.txt',
  './data/eucjp.txt'
]

paths.each do |path|
  content = File.read(path)
  charset = NKF.guess(content)
  puts "#{path}: #{charset}"

  # Convert to UTF-8(without BOM)
  utf8_content = NKF.nkf('-w', content)

  # Write to file
  File.open("#{path}.out", 'w') do |f|
    f.write(utf8_content)
  end
end
