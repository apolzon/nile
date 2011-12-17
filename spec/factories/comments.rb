# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    title "MyString"
    author "MyString"
    body "MyText"
  end
end
