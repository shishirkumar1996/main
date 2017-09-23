module Replyable
  extend ActiveSupport::Concern

  VALID_BODY_REGEX = /[a-zA-Z0-9]/        # /\A(?!(&nbsp;|<p>|<\/p>|\s)*\z).+/

  included do
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :body, presence: true, format: {with: VALID_BODY_REGEX}
    before_save :remove_whitespace
  end

  private

    def remove_whitespace
      unless body.nil?
        body.strip!
        unless body.empty?
          body.prepend '<p>'
          body << '</p>'
          body.gsub! /\s+/, '</p><p>'
        end
      end
    end

end
