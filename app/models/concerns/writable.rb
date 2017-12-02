module Writable
  extend ActiveSupport::Concern
  included do
    TYPE_NAME = self.name.downcase
  end
  def type_name
    TYPE_NAME
  end
end
