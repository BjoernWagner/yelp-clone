require 'rails_helper' 

describe Restaurant, type: :model do
  it { is_expected.to have_many(:reviews).dependent(:destroy) }

  it "is not a valid name if less than three characters" do
    restaurant = Restaurant.create(name: 'KF')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless name is unique" do
    Restaurant.create(name: 'bar1')
    restaurant = Restaurant.new(name: 'bar1')
    expect(restaurant).to have(1).error_on(:name)
  end
end




