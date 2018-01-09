module ManyToManyRelatable
  extend ActiveSupport::Concern

  def initialize_many_to_many(assoc_one, assoc_two)
    assoc_one_id = assoc_two_id = nil
    [assoc_one, assoc_two].each_with_index do |assoc, index|
      klass = assoc[0]
      assoc_name = (assoc.length == 1 ? klass.underscored_name : assoc[1]).to_sym
      assoc_id = "#{assoc_name}_id".to_sym
      belongs_to assoc_name, class_name: "::#{klass.name}"
      validates assoc_id, presence: true
      if index == 0
        assoc_one_id = assoc_id
      else
        assoc_two_id = assoc_id
      end
    end
    validates assoc_one_id, uniqueness: { scope: assoc_two_id }
  end
end
