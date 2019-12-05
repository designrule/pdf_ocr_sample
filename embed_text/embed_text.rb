require "prawn"

text = "相原　久美子"
xys = [
  [157, 333],
]

Prawn::Document.generate("transparent_text.pdf",
                          :page_size => 'A4',
                          :page_layout => :landscape) do |pdf|

  pdf.font "Koruri-Regular.ttf", :size => 11
  pdf.transparent(0) do
  # pdf.transparent(1) do
    xys.each{|xy|
      pdf.text_box text, :at=>xy
    }
  end
end
system('pdftk '+ARGV[0]+' multistamp transparent_text.pdf output '+ARGV[1])
