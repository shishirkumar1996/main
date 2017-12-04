module ManyToManyRelatable
  extend ActiveSupport::Concern
  included do
    self.class_eval do
      klass_split = self.name.split '::'
      klass = klass_split[0].singularize
      belongs_to :user, class_name: '::User'
      klass_underscore = klass.underscore.to_sym
      self.table_name = "#{klass_underscore}_#{klass_split[1].underscore.pluralize}"
      belongs_to klass_underscore, class_name: "::#{klass}"
      validates :user_id, uniqueness: { scope: "#{klass_underscore}_id".to_sym }
    end
  end
end
