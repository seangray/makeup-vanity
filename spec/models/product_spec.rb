require 'rails_helper'

RSpec.describe Product, :type => :model do
	
	subject {
    described_class.new(brand: 'Glossier',
                        name: 'Generation G',
                        size: "mini",
                        category: 'lipstick',
                        shade: 'Jam',
                        color: '#00aaaa')
  }

  it "is valid with valid attributes" do
  	expect(subject).to be_valid
  end

  it "is not valid without a brand" do 
    subject.brand = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do 
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a category" do 
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it "product has a state" do
    expect(subject).to have_state(:unopen)
    expect(subject).to transition_from(:unopen).to(:open).on_event(:open)
    expect(subject).to transition_from(:open).to(:finished).on_event(:finish)
    expect(subject).to transition_from(:open).to(:destashed).on_event(:destash)
  end
end