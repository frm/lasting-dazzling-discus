require_relative "item"

module Todo
  class List
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
      @list.values.map do |todo|
        todo if todo.complete?
      end.compact
    end

    def incomplete
      @list.reject { |id, todo| todo.complete? }.values
    end

    def prune
      @list.delete_if { |id, todo| todo.complete? }
    end

    def count
      @list.length
    end
  end
end
