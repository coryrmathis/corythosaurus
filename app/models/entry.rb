class Entry < ApplicationRecord
  paginates_per 10

  has_many tags, as: :taggable
end
