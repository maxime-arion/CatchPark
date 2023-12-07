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
p time = Time.new(2023, 12, 7, 10, 0, 0)
parking_1 = Parking.new(longitude: -1.545957, latitude: 47.214581, address: "10 Av. Carnot, 44000 Nantes", status: true )
parking_1.save!

p time = Time.new(2023, 12, 7, 7, 15, 0)
parking_2 = Parking.new(longitude: -1.544267, latitude: 47.212722, address: "12 Av. Carnot, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_2.save!

p time = Time.new(2023, 12, 7, 15, 27, 0)
parking_3 = Parking.new(longitude: -1.550955, latitude: 47.215615, address: "10 Rue de Strasbourg, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_3.save!

p time = Time.new(2023, 12, 7, 14, 9, 0)
parking_4 = Parking.new(longitude: -1.552300, latitude: 47.217137, address: "21 Rue de Strasbourg, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_4.save!

p time = Time.new(2023, 12, 7, 8, 30, 0)
parking_5 = Parking.new(longitude: -1.552169, latitude: 47.219695, address: "17 Rue du Roi Albert, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_5.save!

p time = Time.new(2023, 12, 7, 10, 44, 0)
parking_6 = Parking.new(longitude: -1.552727, latitude: 47.218879, address: "5 Rue des Cordeliers, 44000 Nantes", status: true )
parking_6.save!

p time = Time.new(2023, 12, 7, 12, 20, 0)
parking_7 = Parking.new(longitude: -1.554100, latitude: 47.219360, address: "48 Rue de Strasbourg, 44000 Nantes", status: true )
parking_7.save!

p time = Time.new(2023, 12, 7, 14, 0, 0)
parking_8 = Parking.new(longitude: -1.552620, latitude: 47.217611, address: "30 Rue de Strasbourg, 44000 Nantes", status: true )
parking_8.save!

p time = Time.new(2023, 12, 7, 17, 0, 0)
parking_9 = Parking.new(longitude: -1.552167, latitude: 47.211683, address: "7 Chau. de la Madeleine, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_9.save!

p time = Time.new(2023, 12, 7, 18, 0, 0)
parking_10 = Parking.new(longitude: -1.550355, latitude: 47.211408, address: "4 Rue Perrault, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_10.save!

p time = Time.new(2023, 12, 7, 20, 10, 0)
parking_11 = Parking.new(longitude:  -1.549982, latitude: 47.212018, address: "4 Rue des Olivettes, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_11.save!

p time = Time.new(2023, 12, 7, 23, 0, 0)
parking_12 = Parking.new(longitude: -1.548768, latitude: 47.211053, address: "13 Rue Baron, 44000 Nantes", status: true )
parking_12.save!

p time = Time.new(2023, 12, 7, 6, 25, 0)
parking_13 = Parking.new(longitude: -1.546451, latitude: 47.211510, address: "5 Rue de Saverne, 44000 Nantes", status: true )
parking_13.save!

p time = Time.new(2023, 12, 7, 11, 0, 0)
parking_14 = Parking.new(longitude: -1.548450, latitude: 47.209860, address: "4 Imp. Marmontel, 44000 Nantes", status: true )
parking_14.save!

p time = Time.new(2023, 12, 7, 15, 10, 0)
parking_15 = Parking.new(longitude: -1.549421, latitude: 47.209683, address: "4 Rue Marmontel, 44000 Nantes", status: true )
parking_15.save!

p time = Time.new(2023, 12, 7, 16, 35, 0)
parking_16 = Parking.new(longitude: -1.546732, latitude: 47.213198, address: "14 Rue Fouré, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_16.save!

p time = Time.new(2023, 12, 7, 17, 5, 0)
parking_17 = Parking.new(longitude: -1.546321, latitude: 47.213972, address: "7 Rue Fouré, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_2 )
parking_17.save!

p time = Time.new(2023, 12, 7, 9, 0, 0)
parking_18 = Parking.new(longitude: -1.546563, latitude: 47.212982, address: "14 Rue de Jemmapes, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_3 )
parking_18.save!

p time = Time.new(2023, 12, 7, 9, 30, 0)
parking_19 = Parking.new(longitude: -1.546582, latitude: 47.212119, address: "4 ter Rue de Colmar, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_4 )
parking_19.save!

p time = Time.new(2023, 12, 7, 10, 0, 0)
parking_20 = Parking.new(longitude: -1.546115, latitude: 47.212487, address: "2 Rue de Mayence, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_5 )
parking_20.save!

p time = Time.new(2023, 12, 7, 13, 45, 0)
parking_21 = Parking.new(longitude:  -1.557172, latitude: 47.216022, address: "1 Rue de Feltre Bis, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_4 )
parking_21.save!

p time = Time.new(2023, 12, 7, 18, 0, 0)
parking_22 = Parking.new(longitude: -1.556796, latitude: 47.215690, address: "1 Rue de Feltre, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_2 )
parking_22.save!

p time = Time.new(2023, 12, 7, 15, 0, 0)
parking_23 = Parking.new(longitude: -1.544647, latitude: 47.224644, address: "125 Rue Général Buat, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_1 )
parking_23.save!

p time = Time.new(2023, 12, 7, 8, 10, 0)
parking_24 = Parking.new(longitude: -1.547348, latitude: 47.208101, address: "19 Rue Émile Péhant, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_3 )
parking_24.save!

p time = Time.new(2023, 12, 7, 12, 15, 0)
parking_25 = Parking.new(longitude: -1.547137, latitude: 47.207914, address: "21 Rue Émile Péhant, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_5 )
parking_25.save!

p time = Time.new(2023, 12, 7, 7, 25, 0)
parking_26 = Parking.new(longitude: -1.546926, latitude: 47.207727, address: "23 Rue Émile Péhant, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration:(time + 60000*0.25) - time, user: user_2 )
parking_26.save!

p time = Time.new(2023, 12, 7, 14, 3, 0)
parking_27 = Parking.new(longitude: -1.546715, latitude: 47.207540, address: "15 Rue Émile Péhant, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_1 )
parking_27.save!

p time = Time.new(2023, 12, 7, 10, 22, 0)
parking_28 = Parking.new(longitude: -1.546504, latitude: 47.207353, address: "13  Rue Émile Péhant, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_3 )
parking_28.save!

p time = Time.new(2023, 12, 7, 19, 38, 0)
parking_29 = Parking.new(longitude: -1.569588, latitude: 47.220787, address: "84 Rue Félibien Bis, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_4 )
parking_29.save!

p time = Time.new(2023, 12, 7, 21, 0, 0)
parking_30 = Parking.new(longitude: -1.563798, latitude: 47.220891, address: "8 Rue Félibien, 44000 Nantes", status: false, start_time: time, end_time: (time + 60000*0.25), duration: (time + 60000*0.25) - time, user: user_5 )
parking_30.save!
puts 'Finished!'
