module VotesHelper
  ['upvote', 'downvote'].each do |vote|
    voted_type = "#{vote}d"
    define_method("display_#{vote}") do |entity, voted = nil|
      voted = entity.public_send("#{voted_type}?", current_user) if voted.nil?
      if voted
        content_tag :span, voted_type.capitalize, class: 'action-completed'
      else
        form_tag(votes_path, method: :post, remote: true) do
          concat hidden_field_tag(:entity_type, entity.type_name)
          concat hidden_field_tag(:entity_id, entity.id)
          concat hidden_field_tag(:vote_type, vote)
          concat submit_tag(vote.capitalize, class: 'btn-common btn-action')
        end
      end
    end
  end
end
