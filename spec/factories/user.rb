FactoryGirl.define do
  sequence :username do |n|
    "person#{n}"
  end
  sequence :email do |n|
      "person#{n}@email.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    username
    email
    password '12345678'
    password_confirmation '12345678'
  end
end