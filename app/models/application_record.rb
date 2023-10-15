class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  self.per_page = Rails.configuration.per_page
end
