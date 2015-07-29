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

	def gallery_parse(text)
		galleries=text.scan(/image_block(\([^\)]*\))/)
		rt = text
		galleries.each do |gallery|
            subst= "image_block" + gallery.to_s.gsub(/[\"\]\[]/,"")
            gallery_code = ""
			gallery.each do |pic|
			    gallery_code += '<gallery>'
			    pic.gsub(/[\(\)]/,"").split(",").each do |pict|
			        gallery_code += "<img>" + pict
			    end
			    gallery_code += '</gallery>'
			rt = rt.gsub(subst,gallery_code)
			end
		end
		rt
	end
end
