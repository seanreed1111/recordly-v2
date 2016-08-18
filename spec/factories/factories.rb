#include all factories in one file!!!

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "example#{n}@example.com"}
    password "password"
    password_confirmation "password"

  end

  # factory :album do
  #   name FFaker::Music.album
  #   artist nil
  #   sequence(:id) {|id|id}
  #   song nil
  # end

  factory :artist do
    name FFaker::Music.artist
    sequence(:id) {|id|id}
  end

  # factory :song do
  #   name FFaker::Music.song
  #   album_id nil
  #   sequence(:id) {|id|id}
  # end

  factory :favorite  do
    user nil
    favoritable_id  1
    favoritable_type "type"
  end
end

