class Message < ActiveRecord::Base
  belongs_to :channel
  belongs_to :author, class_name: 'User'

  scope :created_after, ->(time) { where(arel_table[:created_at].gt(time)) }
end
