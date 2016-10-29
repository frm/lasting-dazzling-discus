require_relative "spec_helper"
require_relative "../lib/todo/list"

RSpec.describe "Todo List" do
  let(:list) { Todo::List.new }

  it "adds todos" do
    text = "clean the house"

    expect(list.count).to eq(0)

    list.add(text)

    expect(list.count).to eq(1)
  end

  it "removes todos" do
    id = list.add("mow the lawn")

    list.remove(id)

    expect(list.count).to eq(0)
  end

  it "gets todos" do
    text = "mow the lawn"

    id = list.add("mow the lawn")

    expect(list[id].text).to eq(text)
  end

  it "marks a given todo as complete" do
    id = list.add("mow the lawn")

    list.complete_todo(id)

    expect(list[id]).to be_complete
  end

  it "lists the todos" do
    todos = [
     "clean the house",
     "mow the lawn",
    ].map { |text| list.add(text) }

    todos.each do |todo|
      expect(list.all).to include(list[todo])
    end
  end

  it "list the completed todos" do
    complete_todo = list.add("clean the house")
    incomplete_todo = list.add("mow the lawn")

    list[complete_todo].complete

    expect(list.complete.values).to include(list[complete_todo])
    expect(list.complete.values).not_to include(list[incomplete_todo])
  end

  it "lists the incomplete todos" do
    complete_todo = list.add("clean the house")
    incomplete_todo = list.add("mow the lawn")

    list[complete_todo].complete

    expect(list.incomplete.values).not_to include(list[complete_todo])
    expect(list.incomplete.values).to include(list[incomplete_todo])
  end

  it "removes old, complete todos" do
    complete_todo = list.add("clean the house")
    incomplete_todo = list.add("mow the lawn")

    list[complete_todo].complete
    list.prune

    expect(list.count).to eq(1)
    expect(list.all).to include(list[complete_todo])
  end
end
