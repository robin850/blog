require 'factory_girl'

FactoryGirl.define do
  factory :article do
    title "Foo Bar"
    body "Hello world"
    slug "foo-bar"
    description "Lorem ipsum dolor"
    introduction "sit amet [foo](http://bar.net)"
    published :on
    further true
  end

  factory :comment do
    body "Hello world!"
    author "John Doe"
    email "foo@bar.net"
  end
end
