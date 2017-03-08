class SearchProduct < ApplicationRecord
#attr_accessor :popularity,:term

def self.terms_for(prefix)
	suggestions = where("term like ?", "%#{prefix}%")
	suggestions.limit(10).pluck(:term)
end
		
end
