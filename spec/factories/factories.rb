#include all factories in one file!!!

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "example#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :album do
    name "ThisisMyAlbum"
    user nil
    artist nil

    trait :with_songs do
      after(:create) do |instance|
        create_list :song, 2, album: instance
      end
    end
  end

  factory :song do
    sequence(:name) {|n| "This is Song #{n}"}
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

    trait :album do
      favoritable_type "Album"
    end
    trait :artist do
      favoritable_type "Artist"
    end
    trait :song do
      favoritable_type "Song"
    end
  end
end

