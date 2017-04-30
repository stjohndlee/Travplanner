class Post < ApplicationRecord
    has_many :users, through: :memberships
    has_many :memberships, depedent: :destroy
    has_many :invites, dependent: :destroy
    has_many :traveldays, dependent: :destroy
end
