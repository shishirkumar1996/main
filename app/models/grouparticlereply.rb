class Grouparticlereply < ApplicationRecord
	include Replyable
	belongs_to :grouparticle
end
