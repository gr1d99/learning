module TheOdinProject
  class PageBreak
    def self.start
      100.times do |n|
        n = if n + 1 == 50
              'Break'
            else
              '*'
            end
        print n
      end
    end
  end
end
