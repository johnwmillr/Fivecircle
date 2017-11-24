FactoryGirl.define do
  sequence :username do |m|
    "merchant#{m}"
  end
  sequence :email do |m|
      "merchant#{m}@email.com"
  end
  sequence :address do |m|
      "#{m}"
  end
end

FactoryGirl.define do
  factory :merchant, :class => 'Merchant' do
    username
    email
    address
    password '12345678'
    password_confirmation '12345678'
  end
end