module ManyToManyRelatable
  extend ActiveSupport::Concern
  included do
    self.class_eval do
      class_split = self.name.split '::'
      class_name_plural = class_split.pop.underscore.pluralize
      module_name_singular = "::#{class_split.join.singularize}"
      assoc_name = class_split.map!{|x| x.singularize.underscore}.join('_').to_sym
      assoc_name_id = "#{assoc_name}_id".to_sym
      self.table_name = "#{assoc_name}_#{class_name_plural}"
      belongs_to assoc_name, class_name: module_name_singular
      belongs_to :user, class_name: '::User'
      validates :user_id, presence: true
      validates assoc_name_id, presence: true
      validates :user_id, uniqueness: { scope: assoc_name_id }
    end
  end
end
