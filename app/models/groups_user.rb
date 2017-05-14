class GroupsUser < ApplicationRecord
  belongs_to :user,foreign_key: :user_id
  belongs_to :group,foreign_key: :group_id
  validates :user_id, presence: true
  validates :group_id, presence: true
end
