# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Parking.destroy_all
User.destroy_all

puts 'Creating users...'
user_1 = User.new(username: "Maxence", email: "coquelicot-magique@gmail.com", password: "000000")
user_1.save!

puts 'Creating users...'
user_2 = User.new(username: "Yves", email: "yves370@gmail.com", password: "000000")
user_2.save!

puts 'Creating users...'
user_3 = User.new(username: "Claude", email: "claudedubois44@gmail.com", password: "000000")
user_3.save!

puts 'Creating users...'
user_4 = User.new(username: "Bernard", email: "bernard.leroy@gmail.com", password: "000000")
user_4.save!

puts 'Creating users...'
user_5 = User.new(username: "Sam", email: "sam6454@gmail.com", password: "000000")
user_5.save!
puts 'Finished!'
# 'status = true' = disponible
# 'status = false' = indisponible
puts 'Creating parkings...'
p time = Time.new(2023, 12,8 , 10, 0, 0)
parking_1 = Parking.new(longitude: -1.5534, latitude: 47.2173, status: true )
parking_1.save!

p time = Time.new(2023, 12,8 , 7, 15, 0)
parking_2 = Parking.new(longitude: -1.552201, latitude: 47.212502, status: true )
parking_2.save!

p time = Time.new(2023, 12,8 , 15, 27, 0)
parking_3 = Parking.new(longitude: -1.551990, latitude: 47.212215, status: true )
parking_3.save!

p time = Time.new(2023, 12,8 , 14, 9, 0)
parking_4 = Parking.new(longitude: -1.551779, latitude: 47.212028, status: true )
parking_4.save!

p time = Time.new(2023, 12,8 , 8, 30, 0)
parking_5 = Parking.new(longitude: -1.551568, latitude: 47.211841, status: true )
parking_5.save!

p time = Time.new(2023, 12,8 , 10, 44, 0)
parking_6 = Parking.new(longitude: -1.551357, latitude: 47.211654, status: true )
parking_6.save!

p time = Time.new(2023, 12,8 , 12, 20, 0)
parking_7 = Parking.new(longitude: -1.550935, latitude: 47.211280, status: true )
parking_7.save!

p time = Time.new(2023, 12,8 , 14, 0, 0)
parking_8 = Parking.new(longitude: -1.550724, latitude: 47.211093, status: true )
parking_8.save!

p time = Time.new(2023, 12,8 , 17, 0, 0)
parking_9 = Parking.new(longitude: -1.550513, latitude: 47.210906, status: true )
parking_9.save!

p time = Time.new(2023, 12,8 , 18, 0, 0)
parking_10 = Parking.new(longitude: -1.550302, latitude: 47.210719, status: true )
parking_10.save!

p time = Time.new(2023, 12,8 , 20, 10, 0)
parking_11 = Parking.new(longitude: -1.550091, latitude: 47.210532, status: true )
parking_11.save!

p time = Time.new(2023, 12,8 , 23, 0, 0)
parking_12 = Parking.new(longitude: -1.549880, latitude: 47.210345, status: true )
parking_12.save!

p time = Time.new(2023, 12,8 , 6, 25, 0)
parking_13 = Parking.new(longitude: -1.549669, latitude: 47.210158, status: true )
parking_13.save!

p time = Time.new(2023, 12,8 , 11, 0, 0)
parking_14 = Parking.new(longitude: -1.549458, latitude: 47.209971, status: true )
parking_14.save!

p time = Time.new(2023, 12,8 , 15, 10, 0)
parking_15 = Parking.new(longitude: -1.549247, latitude: 47.209784, status: true )
parking_15.save!

p time = Time.new(2023, 12,8 , 16, 35, 0)
parking_16 = Parking.new(longitude: -1.549036, latitude: 47.209597, status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_16.save!

p time = Time.new(2023, 12,8 , 17, 5, 0)
parking_17 = Parking.new(longitude: -1.548825, latitude: 47.209410, status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_2 )
parking_17.save!

p time = Time.new(2023, 12,8 , 9, 0, 0)
parking_18 = Parking.new(longitude: -1.548614, latitude: 47.209223, status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_3 )
parking_18.save!

p time = Time.new(2023, 12,8 , 9, 30, 0)
parking_19 = Parking.new(longitude: -1.548403, latitude: 47.209036, status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_4 )
parking_19.save!

p time = Time.new(2023, 12,8 , 10, 0, 0)
parking_20 = Parking.new(longitude: -1.548192, latitude: 47.208849, status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_5 )
parking_20.save!

p time = Time.new(2023, 12,8 , 13, 45, 0)
parking_21 = Parking.new(longitude: -1.547981, latitude: 47.208662, status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_4 )
parking_21.save!

p time = Time.new(2023, 12,8 , 18, 0, 0)
parking_22 = Parking.new(longitude: -1.547770, latitude: 47.208475, status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_2 )
parking_22.save!

p time = Time.new(2023, 12,8 , 15, 0, 0)
parking_23 = Parking.new(longitude: -1.547559, latitude: 47.208288, status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_1 )
parking_23.save!

p time = Time.new(2023, 12,8 , 8, 10, 0)
parking_24 = Parking.new(longitude: -1.547348, latitude: 47.208101, status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_3 )
parking_24.save!

p time = Time.new(2023, 12,8 , 12, 15, 0)
parking_25 = Parking.new(longitude: -1.547137, latitude: 47.207914, status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_5 )
parking_25.save!

p time = Time.new(2023, 12,8 , 7, 25, 0)
parking_26 = Parking.new(longitude: -1.546926, latitude: 47.207727, status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_2 )
parking_26.save!

p time = Time.new(2023, 12,8 , 14, 3, 0)
parking_27 = Parking.new(longitude: -1.546715, latitude: 47.207540, status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_27.save!

p time = Time.new(2023, 12,8 , 10, 22, 0)
parking_28 = Parking.new(longitude: -1.546504, latitude: 47.207353, status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_3 )
parking_28.save!

p time = Time.new(2023, 12,8 , 19, 38, 0)
parking_29 = Parking.new(longitude: -1.546293, latitude: 47.207166, status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_4 )
parking_29.save!

p time = Time.new(2023, 12,8 , 21, 0, 0)
parking_30 = Parking.new(longitude: -1.545678, latitude: 47.214513, status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_5 )
parking_30.save!
puts 'Finished!'
