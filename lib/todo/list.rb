require_relative "item"

module Todo
  class List
    @@complete = -> (id, todo) { todo.complete? }

    # As a matter of personal taste, I would remove the @@complete
    # And rewrite it like so:
    # class << self
    #   def complete
    #     @_complete ||= -> (id, todo) { todo.complete? }
    #   end
    # end

    def initialize
      @list = {}
      @id = 0
    end

    def add(text)
      @id += 1
      @list[@id] = Todo::Item.new(text)

      @id
    end

    def remove(id)
      @list.delete(id)
    end

    def [](id)
      @list[id]
    end

    def complete_todo(id)
      @list[id].complete
    end

    def all
      @list.values
    end

    def complete
      @list.select(&@@complete).values
    end

    def incomplete
      @list.reject(&@@complete).values
    end

    def prune
      @list.delete_if(&@@complete)
    end

    def count
      @list.length
    end
  end
end
