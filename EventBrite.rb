#!/usr/bin/env ruby

require 'mysql'
require 'eventbrite-client'

#Authentication sub-code
eb_auth_tokens = {app_key: 'EPB4F5JGEUACSDH7AK',
                 user_key: '139629308995447067749'}
eb_client = EventbriteClient.new(eb_auth_tokens)


#Options sub-code
valid_formats = "%Y-%m-%d"
event_options = {only_display: 'id,start_date,end_date,status,description'}


#Event list sub-code
eventResp = eb_client.user_list_events(event_options)
#puts eventResp
eventDetails = Array.new
eventResp.each do |key1, array1|
	array1.each do |key2, array2|
		key2.each do |key3, array3|	
			eventDetails.push array3
		end
	end
end
#puts eventDetails


#Attendee list sub-code
attendeeDetails = Array.new
eventDetails.each { |x|
	enddate = x["end_date"].split(' ') 
	if Date.today.to_s == enddate	&& x["status"] == "Completed"
	#if "2014-11-05" == enddate[0] && x["status"] == "Completed"
		begin 
			attendeeResp = eb_client.event_list_attendees({id:x["id"], show_full_barcodes: 'true'})
		rescue
		else
			#puts attendeeResp
			attendeeResp.each do |key1, array1|
				array1.each do |key2, array2|
					key2.each do |key3, array3|
						attendeeDetails.push array3.merge(x)			
					end
				end
			end
		end
	end
}
#puts Date.today.to_s
#puts attendeeDetails


#MySQL Database connection and queries to load into the Database
attendeeDetails.each { |x|
	#puts x
	firstname = x["first_name"]
	lastname = x["last_name"]
	emailid = x["email"]
	eventid = x["event_id"]
	eventtitle = x["title"]
	eventdescription = x["description"]
	eventdate = x["start_date"]
	begin
		attendance = x["barcodes"][0]["barcode"]["status"]
	rescue
		attendance = "unused"
	end
	begin
		uin = x["answers"][0]["answer"]["answer_text"]
	rescue
		uin = 'null'
	end
	begin    
		con = Mysql.new 'localhost', 'root', 'mypassword', 'popup_classes'
   		con.query("INSERT INTO Student_Info VALUES(#{uin},'#{firstname}','#{lastname}','#{emailid}')")
		con.query("INSERT INTO Class_Enrollment VALUES('#{emailid}','#{eventid}','#{eventdate}','#{attendance}')")
	rescue Mysql::Error => e
    		puts e.errno
    		puts e.error
	ensure
    		con.close if con
	end
}

=begin
puts attendeeDetails[0]["event_id"]
puts attendeeDetails[0]["title"]
puts attendeeDetails[0]["description"]
puts attendeeDetails[1]["start_date"]
puts attendeeDetails[1]["barcodes"][0]["barcode"]["status"]
puts attendeeDetails[1]["answers"][0]["answer"]["answer_text"]
rescue
puts "null"
end
puts attendeeDetails[1]["first_name"]
puts attendeeDetails[1]["last_name"]
puts attendeeDetails[1]["email"]
=end
