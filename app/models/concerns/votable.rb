module Votable
  extend ActiveSupport::Concern
  included do
    self.class_eval do
      class_plural = self.name.pluralize
      has_many :upvotes, class_name: "#{class_plural}::Upvote"
      has_many :downvotes, class_name: "#{class_plural}::Downvote"
      class_plural = class_plural.underscore
      ['upvoted', 'downvoted'].each do |method_name|
        define_method("#{method_name}?") do |current_user|
          current_user.public_send("#{method_name}_#{class_plural}").include? self
        end
      end
    end
  end
end
