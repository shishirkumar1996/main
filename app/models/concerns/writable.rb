module Writable
  extend ActiveSupport::Concern
  included do
    self.class_eval do
      class_name = self.name.underscore
      define_method("type_name") do
        class_name
      end
    end
  end
end
