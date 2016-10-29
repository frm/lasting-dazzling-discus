module Todo
  class Item
    attr_reader :text

    def initialize(text)
      @text = text
      @status = :incomplete
    end

    def complete?
      @status == :complete
    end

    def complete
      @status = :complete
    end
  end
end
