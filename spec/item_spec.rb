require_relative "spec_helper"
require_relative "../lib/todo/list"

RSpec.describe "Todo Item" do
  it "has a text" do
    text = "clean the house"
    item = Todo::Item.new(text)

    expect(item.text).to eq(text)
  end

  it "is incomplete when created" do
    item = Todo::Item.new("mow the lawn")

    expect(item).not_to be_complete
  end

  it "can be marked as completed" do
    item = Todo::Item.new("conquer the world")

    item.complete

    expect(item).to be_complete
  end
end
