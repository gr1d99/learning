require_relative './lib/page_break'

module TheOdinProject
  class Blocks
    def self.block1
      5.times { p "damn" }
      "eeee".gsub('e'){ p "found and E" }
    end
  end
end

break_page  = TheOdinProject::PageBreak

TheOdinProject::Blocks.block1
break_page.start
