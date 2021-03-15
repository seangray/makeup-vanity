# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Product.new
  p.brand = row["brand"]
  p.name = row["name"]
  p.category = row["category"]
  p.shade = row["shade"]
  p.size = row["size"]
  p.purchase_date = row["purchase_date"]
  p.price = row["price"]
  p.planned = row["planned"]
  p.retailer = row["retailer"]
  p.face_area = row["face_area"]
  p.online = row["online"]
  p.save
end