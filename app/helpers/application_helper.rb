module ApplicationHelper
	def small_user_badge(user)
		render partial: "shared/smallbadge", locals: { user: user }
	end
end
