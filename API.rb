
require 'rubygems'
require 'mail'


smtp = { :address => 'smtp.gmail.com', 
            :port => 587, 
            :domain => 'google.com',
            :user_name            => 'seprojecttestmail@gmail.com',
            :password             => 'seproject',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
Mail.defaults { delivery_method :smtp, smtp }
mail_lst = ['caharsha@tamu.edu','kakaly@tamu.edu']

mail_lst.each { 
            |a|
mail = Mail.new do
  from 'test@fiendz.org'
  to a
  subject 'Remainder mail'
  body 'This is a test email'
end
mail.deliver! 
            
}


