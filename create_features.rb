require 'rubygems'
require 'active_support/all'
require 'roo'
require 'spreadsheet'
require 'pry'

puts "The following feature files were created based on the excel sheets - /features/step_definitions/*.xlsx: \n "
new_folder_name = "new_files"
Dir.mkdir(new_folder_name) unless File.exists?(new_folder_name)

$manifest_file = File.join(File.dirname(__FILE__), 'features', 'manifest.json')
$params = JSON.parse(File.open($manifest_file).read)['params'] #Have access to all params in manifest file
env = $params['environment']['name']

# Usage Please pass the excel file name as an argument or specify it in 
# else part of the following condition.
# -c flag to copy feature files directly to features folder
# ex: ruby create_features.rb -c
# specify the file name as well:
# ex: ruby create_features.rb -c features/step_definitions/campaign_regression.xlsx
# just the file name
# ex: ruby create_features.rb features/step_definitions/campaign_regression.xlsx


data_driven = false

file_names = Dir["./features/step_definitions/*.xlsx"]
final_folder = "./features/"
if ARGV.length > 0
	if ARGV[0] == "-n"
		final_folder = "./new_files/"
		if  ARGV[1]
			file_name = ARGV[1]
		end
	elsif ARGV[0] == "-c"
		final_folder = "./features/"
		if  ARGV[1]
			file_name = ARGV[1]
		end
	elsif ARGV[0] == "-d"
		data_driven = true
		final_folder = "./features/"
		if  ARGV[1]
			file_name = ARGV[1]
		end
	else
		file_name = ARGV[0]
	end
	if file_name
		$my_root = File.join(File.dirname(__FILE__),'/')
		file_names = ["#{$my_root}/#{file_name}"]
	end
end

$my_root_assets = File.join(File.dirname(__FILE__),'/features/step_definitions/')
data_book = Roo::Spreadsheet.open("#{$my_root_assets}data.xlsx") rescue nil




file_names.select! do |file|
	file.split("/").last[0..1] != '~$'
end
file_names.each do |file_name|
	next if file_name.include? "data.xlsx"
	next if file_name.include? "sample_requests.xlsx"
	book = Roo::Spreadsheet.open(file_name)


	book.sheets.each do |e|
		file_name = file_name.split("/").last
		puts e + ".feature"
		user_data = book.sheet(e)
		file = File.new("#{final_folder}#{e}.feature", "w")
		@header_columns = user_data.row(1)[0..user_data.last_column]
		@header_columns.map!{ |el| el.downcase rescue nil}

		# write_feature_scenario(file, e)
		file.write("Feature: This feature file tests all the scenarios from #{e} tab on #{file_name}"+"\n\n")
		# binding.pry
		file.write("  Background:
    * I read the data from the \"#{file_name}\" and \"#{e}\" tab"+"\n ")

		# @test_data = {}
		for i in 2..user_data.last_row
			# puts user_data.row(i)[@header_columns.index("request type")] POST
			# @test_data[user_data.row(i)[0]] = user_data.row(i)[1..user_data.last_column]
			# binding.pry	
			unless user_data.row(i)[0].nil?
				requset_type = nil
				request_type_column_present = (user_data.row(i)[@header_columns.index("request type") || @header_columns.index("method/verb")] && user_data.row(i)[@header_columns.index("request type") || @header_columns.index("method/verb")].length > 0) rescue false

				if request_type_column_present
					requset_type = "\"#{user_data.row(i)[@header_columns.index("request type") || @header_columns.index("method/verb")]}\""
				end
				scenario = user_data.row(i)[@header_columns.index("scenario")]
				tags = user_data.row(i)[@header_columns.index("test id")].to_s rescue nil
				tags = "@" + tags + "\n" if tags && tags.length > 0
				element_name = user_data.row(i)[@header_columns.index("variable")|| @header_columns.index("element")] rescue ''
				smoke_test = user_data.row(i)[@header_columns.index("smoke test id")] rescue user_data.row(i)[0]
				expected_response = user_data.row(i)[@header_columns.index("expected response")] rescue nil
				expected_code = user_data.row(i)[@header_columns.index("code")] rescue nil
				expected_headers = user_data.row(i)[@header_columns.index("expected headers")] rescue nil
				if data_driven
          data_sheet = data_book.sheet("#{e}_#{env}") rescue nil
						if data_sheet
							(1...data_sheet.last_row).each do |data_row|
								data_scenario = data_sheet.row(data_row+1)[0] if data_sheet.row(1)[0].downcase == 'scenario'
								file.write("\n #{tags} Scenario:#{data_row.to_s.gsub("\n","")} #{data_scenario.to_s.gsub("\n","")} #{scenario.to_s.gsub("\n","")}\n")
								for i in 2..user_data.last_row
                  step_info = ""
									setup_steps = ""
									data_sheet.row(data_row+1).each_with_index { |val, index|
										step_info = step_info + "#{data_sheet.row(1)[index]}:#{val}, " if val && data_sheet.row(1)[index] !~ /^*?(STEPS)|(comment)|(SCENARIO)$/
										setup_steps =  "#{val}" if val && data_sheet.row(1)[index] =~ /^*?(SETUP_STEPS)$/
										setup_steps = setup_steps.gsub("execute_test", "").gsub("\n",", ")
                  }
                  to_check = ""
									to_check = to_check + "Response code should be " + expected_code.to_s + ", " if expected_code
									to_check = to_check + "Response body should match with " + expected_response.gsub("\n","")  + ", " if expected_response
									to_check = to_check + "Response headers should match " + expected_headers.gsub("\n","") + ", " if expected_headers
									while to_check.include? "  "
                    to_check = to_check.gsub("  ", " ")
                  end
									#file.write("    * execute \"#{user_data.row(i)[0]}\" for data \"#{data_row}\"\n") if user_data.row(i)[0]
									file.write("#   When I make a setup request #{setup_steps}\n") if user_data.row(i)[0] && setup_steps.length > 0
									file.write("    And I check request #{smoke_test} with #{step_info.gsub("\n"," ").gsub("\"","'")}in scenario \"#{data_row}\" \"#{user_data.row(i)[0]}\"\n") if user_data.row(i)[0]
									file.write("#   Then The #{to_check}\n") if user_data.row(i)[0]
								end
							end
            else
              puts "No data found for scenarios #{e}, env: #{env}"
							file.close
              File.delete(file)
            end
					break
				else
					if user_data.row(i)[0]
						file.write("\n #{tags} Scenario:#{element_name}:#{scenario}:: #{user_data.row(i)[@header_columns.index("api name") || @header_columns.index("end point")]},
    * execute \"#{user_data.row(i)[0]}\"\n")
					end
				end
			end
		end
		file.close if file
		# binding.pry
	end
	puts "\nNow you can run your feature file by the command: 'cucumber <your_file_name>.feature'."
end


