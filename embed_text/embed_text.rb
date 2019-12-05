require "prawn"

text = "相原　久美子"
xys = [
  [
  [157, 333],
  ], # page1
  [], #page2
  [], #page3
  [], #page4
  [], #page5
  [], #page6
  [], #page7
  [], #page8
  [], #page9
  [], #page10
  [], #page11
  [], #page12
  [], #page13
  [], #page14
  [], #page15
  [],#page16
  [], #page17
]

Prawn::Document.generate("transparent_text.pdf",
                          :page_size => 'A4',
                          :page_layout => :landscape) do |pdf|

  pdf.font "Koruri-Regular.ttf", :size => 11
  pdf.transparent(0) do
  # pdf.transparent(1) do
  xys.each_with_index{|page, p|
    page.each{|xy|
      pdf.text_box text, :at=>xy
    }
    if xys.length - 1  != p then
      pdf.start_new_page
    end
  }
end
end
system('pdftk '+ARGV[0]+' multistamp transparent_text.pdf output '+ARGV[1])
