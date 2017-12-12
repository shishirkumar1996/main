module VoteType
  extend ActiveSupport::Concern
  VOTE_TYPES = {}
  ['upvote', 'downvote'].each{|vote| VOTE_TYPES[vote] = vote}
  private_constant :VOTE_TYPES
  private
    def find_vote_type(vote)
      VOTE_TYPES[vote]
    end
end
