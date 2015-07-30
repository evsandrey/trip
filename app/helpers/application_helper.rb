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
			    gallery_code += '<div id="owl-demo" class="owl-demo owl-carousel owl-theme">'
			    
			    pic.gsub(/[\(\)]/,"").split(",").each do |pict|
			    	if photo = Picture.where(id: pict).first
			    		gallery_code += '<div class="item"><img src="' + photo.photo(:slide) + '"/></div>'
			    	end
			    end
			    
			    
			    gallery_code += '</div>'
			rt = rt.gsub(subst,gallery_code)
			end
		end
		rt
	end
end
