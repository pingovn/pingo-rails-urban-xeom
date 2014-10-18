# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :driver do
    first_name "MyString"
    last_name "MyString"
    address "MyString"
    phone "MyString"
    birthday "2014-10-17"
    gender 1
    driver_license "MyString"
    job "MyString"
  end
end
