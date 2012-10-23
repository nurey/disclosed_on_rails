# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
require 'benchmark'

time = Benchmark.realtime do
  CSV.foreach('db/canada_revenue_agency_contracts.csv') do |row|

    agency_name = row[1]
    vendor_name = row[2]

    attrs = {
      uri: row[0],
      reference_number: row[3],
      contract_date: row[4],
      description: row[5],
      contract_period: row[6],
      delivery_date: row[7],
      contract_value: row[8],
      comments: row[9]
    }

    vendor = Vendor.find_or_create_by_name(vendor_name)
    agency = Agency.find_or_create_by_name(agency_name)
    contract = Contract.create(attrs.merge({ vendor_id: vendor.id, agency_id: agency.id }))
  end
end

puts "Time elapsed: #{time}*1000"
