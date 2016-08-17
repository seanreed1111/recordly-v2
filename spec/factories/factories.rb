#include all factories in one file!!!

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "example#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :album do
    name FFaker::Music.album
    artist
    sequence(:id) {|id|id}
  end

  factory :artist do
    name FFaker::Music.artist
    sequence(:id) {|id|id}
  end

  factory :song do
    name FFaker::Music.song
    album
    sequence(:id) {|id|id}
  end

  factory :favorite  do
    user
    favoritable_id  1
    favoritable_type "type"
  end
    
  end

end
