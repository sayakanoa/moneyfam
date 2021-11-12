class Want < ApplicationRecord
    belongs_to :user
    has_one :buy

    enum priority: { low: 0, middle: 1, high: 2 }
end
