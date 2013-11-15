module PagesHelper
	def md1(text)
    	temp=text.scan /\*{2}.+\*{2}/
		temp.each do |t|
           
        	t=t.gsub(/\A\*{2}/, '<b>')
        	t=t.gsub(/\*{2}\z/, '</b>')
        	text[/\*{2}.+\*{2}/]=t
    	end#\\{2}\w+?\\{2}
        text
	end

	def md2(text)
		temp1=text.scan (/\\\\.+?\\\\/)
		temp1.each do |t1|
    		t1=t1.gsub(/\A\\\\/, '<i>')
    		t1=t1.gsub(/\\\\\z/, '</i>')
    		text[/\\\\.+?\\\\/]=t1
		end
	text
	end
	def md3(text)
    	temp1=text.scan (/\({2}.+?\){2}/)
        temp1.each do |t1|
    		t1=t1.gsub(/\(\(/, '<a href="')
           	t1[/\<a href\=.+?\s/]=t1[/\<a href\=.+?\s/]+'> '
            t1=t1.gsub(/\)\)\z/, '</a>')
            puts t1
    		text[/\({2}.+?\){2}/]=t1
		end
        text
	end
end
