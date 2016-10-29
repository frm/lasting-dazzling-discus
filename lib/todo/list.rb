require_relative "item"

module Todo
  class List
    def initialize
      @id = 0
      @list = {}
    end

    def add(text)
      @id += 1
      item = Todo::Item.new(text)

      @list[@id] = item

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
      complete_todos = []
      @list.values.each do |todo|
        complete_todos << todo if todo.complete?
      end

      complete_todos
    end

    def incomplete
      incomplete_todos = []
      @list.values.each do |todo|
        incomplete_todos << todo unless todo.complete?
      end

      incomplete_todos
    end

    def prune
      @list.each do |id, todo|
        @list.delete(id) if todo.complete?
      end
    end

    def count
      @list.values.count
    end
  end
end
