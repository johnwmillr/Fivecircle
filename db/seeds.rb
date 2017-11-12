# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed file for the Fivecircle User and Media tables

users =[{:username => 'john',     :email => 'john@fake.com',     :password => 'john123'},
        {:username => 'ken',      :email => 'ken@fake.com',      :password => 'ken123'},
        {:username => 'ahmed',    :email => 'ahmed@fake.com',    :password => 'ahmed123'},
        {:username => 'aman',     :email => 'aman@fake.com',     :password => 'aman123'},
        {:username => 'harrison', :email => 'harrison@fake.com', :password => 'harrison123'}]


media =[{:note => "I love burritos...",   :latitude => 41.6602212, :longitude => -91.5346142, :user_id=> 1},
        {:note => "I love pizza...",      :latitude => 41.6602272, :longitude => -91.5341293, :user_id=> 1},
        {:note => "I also love pizza...", :latitude => 41.6602272, :longitude => -91.5341293, :user_id=> 2},        
        {:note => "I love school...",     :latitude => 41.6597985, :longitude => -91.5379424, :user_id=> 3},
        {:note => "I love reading...",    :latitude => 41.6595556, :longitude => -91.5388357, :user_id=> 4},
        {:note => "I love basketball...", :latitude => 41.6582506, :longitude => -91.5468282, :user_id=> 5}]

merchant = [{:merchantName=>"Joe's Place", :username=>"JP",   :email => "JP@fake.com",   :password=>123456,:address=>"115 Iowa Ave, Iowa City, IA 52240",:latitude=>41.661075, :longitude=>-91.533891},
            {:merchantName=>"Pancheros",   :username=>"Panch",:email => "Panch@fake.com",:password=>123456,:address=>"32 S Clinton St, Iowa City, IA 52240",:latitude=>1.6602212,:longitude=>-91.53461424},
            {:merchantName=>"Main Library",:username=>"ML",   :email => "ML@fake.com",   :password=>123456,:address=>"125 West Washington St., Iowa City, IA 52242",:latitude=>41.6595556,:longitude=>-91.5388357}]

# Add the data to the database
users.each do |user|
  User.create!(user)
end

media.each do |medium|
  Medium.create!(medium)
end

merchant.each do |merchant|
    Merchant.create!(merchant)
end