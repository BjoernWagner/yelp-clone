require 'rails_helper' 

describe Restaurant, type: :model do
  it { is_expected.to have_many(:reviews).dependent(:destroy) }
end
describe Restaurant, type: :model do
  it "is not a valid name if less than three characters" do
    restaurant = Restaurant.create(name: 'KF')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
