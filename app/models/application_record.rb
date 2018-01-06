class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def type_name
    self.class.underscored_name
  end

  def self.underscored_name
    @lower_name ||= name.split('::').map!{|x| x.singularize.underscore}.join('_')
  end

  def display_page_url
    self
  end
end
