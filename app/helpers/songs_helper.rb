module SongsHelper
    class MyValidator < ActiveModel::Validator
    def validate(record)
      if (true)
        record.errors.add(:base, 'Cannot duplicate song titles on same album')
      end
    end
  end
end
