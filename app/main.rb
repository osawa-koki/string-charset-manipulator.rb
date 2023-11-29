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
end
