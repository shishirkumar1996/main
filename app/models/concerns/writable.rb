module Writable
  extend ActiveSupport::Concern
  included do
    self.class_eval do
      class_name = self.name.downcase
      define_method("type_name") do
        class_name
      end
    end
  end
end
