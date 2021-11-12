class Buy < ApplicationRecord
    belongs_to :user
    belongs_to :want
end
