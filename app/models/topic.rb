class Topic < ApplicationRecord
    has_many :sponsoredpost, dependent: :destroy
end
