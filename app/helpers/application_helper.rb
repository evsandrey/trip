module ApplicationHelper
	def small_user_badge(user_id)
		user = User.find(user_id)
		render partial: "shared/smallbadge", locals: { user: user }
	end
end
