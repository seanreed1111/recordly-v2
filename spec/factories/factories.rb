#include all factories in one file!!!

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "example#{n}@example.com"}
    password "password"
    password_confirmation "password"
    sequence(:id) {|n|n}
  end

  factory :album do
    name FFaker::Music.album
    user nil
    artist nil

    trait :with_songs do
      after(:create) do |instance|
        create_list :song, 2, album: instance
      end
    end
  end

  factory :song do
    name FFaker::Music.song
    album nil
  end
  
  factory :artist do
    name FFaker::Music.artist
    trait :with_albums do
      after(:create) do |instance|
        create_list :album, 2, artist: instance
      end
    end
  end

  factory :favorite  do
    user nil
    favoritable_id 1
    favoritable_type "Album"
  end
end

