#!/usr/bin/env ruby

require 'tmpdir'

PDFTK_CMD = ENV["PDFTK_CMD"] || "pdftk"

def usage
  puts "usage: meta_pdf.rb <input.pdf> <output.pdf>"
  exit
end

def update_meta(input_file, output_file, title:, subject:)
  Dir.mktmpdir do |dir|
    meta_file = File.join(dir, "meta.txt")
    File.open(meta_file, "w") do |f|
      f.write <<-EOB
InfoBegin
InfoKey: Title
InfoValue: #{title}
InfoBegin
InfoKey: Subject
InfoValue: #{subject}
    EOB
    end
    system(PDFTK_CMD, input_file, "update_info_utf8", meta_file, "output" ,output_file)
  end
end

def main
  usage if ARGV.size != 2

  input_file = ARGV[0]
  output_file = ARGV[1]

  update_meta(input_file, output_file, title: "収支報告書", subject: "相原久美子")
end

main


