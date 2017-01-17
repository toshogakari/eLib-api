require 'securerandom'

FactoryGirl.define do
  sequence(:email) { FFaker::Internet.email }
  sequence(:name) { FFaker::Name.name }
  sequence(:first_name) { FFaker::Name.first_name }
  sequence(:last_name) { FFaker::Name.last_name }
  sequence(:password) { FFaker::Internet.password }
  sequence(:uid) { rand(10**20..10**21).to_s }
  sequence(:expires_at) { SecureRandom.hex(3).hex }
  sequence(:url) { FFaker::Internet.http_url }
  sequence(:domain) { FFaker::Internet.domain_name }
  sequence(:avatar_image) { FFaker::Avatar.image }
  sequence(:time) { FFaker::Time.date }
  sequence(:title) { FFaker::CheesyLingo.title }
  sequence(:gender) { FFaker::Gender.random }
  sequence(:number) { rand(10**20..10**21).to_s }
end

