module ApplicationHelper
	def small_user_badge(user)
		render partial: "shared/smallbadge", locals: { user: user }
	end
	def small_trophy_badge(trophy)
		render partial: "shared/smalltrophy", locals: { trophy: trophy }
	end
	def small_bait_badge(bait)
		render partial: "shared/smallbait", locals: { bait: bait }
	end
end
