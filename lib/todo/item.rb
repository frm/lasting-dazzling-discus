module Todo
  class Item
    def initialize(text)
      @text = text
      @status = :incomplete
    end

    def complete?
      if @status == :complete
        return true
      else
        return false
      end
    end

    def complete
      @status = :complete
    end

    def text
      @text
    end
  end
end
