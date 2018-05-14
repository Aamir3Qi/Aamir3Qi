API testing framework

v1.0.0


Setup

Fill  the excels based on the tooltips.

create feature files:
mac: jruby create_features.rb
win: ruby create_features.rb


add any custom functions or modify default custom functions from custom_functions_api.rb
access test params with current_test.test_params

required custom functions are validate_special_value and generate_request


read migration.txt for migrating from previous version


Best practices:

Create an excel with name sample_requests.xlsx and sample_requests tab
Or create  Smoke_test tab in any of the excel
and use it to store the sample requests.
Merge sample requests with any test case with Smoke test id column
Or execute any sample requests by id with  execute test funciton. this will validate the response as well

use capture by path unless you don't know the element location to be captured.

If the response is a string or intereg, in can be captured into the "R" key in test params by setting capture column to 'r'.


___________________________________________
Multipart requests

to send multipart requests use a regular json requests with files names for the value of the files.
Drop files into step definitions folder.

{"uploads":"1.pdf",
 "userID": 123
 }

for multiple files use an array this way:

{"files":["1.pdf", "2.pdf"] }


_____________________________________
Data driven

you need different feature files for each environment.
Creating feature files for data driven testing is:

create_features.rb -d

add excel file data.xlsx to the step definition folder
create sheets with  <yourTestSheetName_environmentName> as  sheet names.
The table must have header columns for the params names and rows with data.
if the data for each environment is not the same, re-create feature files after switching the environment, also,
upload to awetest to different folders, create a folder per environment
the test flow will execute for each row of data.

Optionally you can have first column as scenario in the data driven excel which will put that value in the html report

___________________________
other

set proxy for outside of your company network APIs: "http://proxy.mycompany.com" in env params



creating feature files:
add flag -n to create feature files into the "new_files" folder instead of default location
add -d files to create data driven feature files
specify the excel for which feature files should be created ex: create_features.rb features/step_definitions/scenarios.xlsx



_________________________
Performance testing
In order to setup a performance test you will need in your manifest.json
file or in Awetest under test variables create a variable performance

{
    "params":{
        "environment":{
            "url":"",
            "name":"DEV"
        },
        "variables": {
            "performance": {
                "enabled": "true",
                "duration_minutes": "1",
                "threads_number": "20",
                "max_loops": "15",
                "evenly_increment_by": "",
                "increment_by_thread_num": "2",
                "increment_every_num_seconds": "5",
                "log_all_requests": "true",
                "request_retry_attempts": "0"
            }
        }
    }
}

if enabled is set to true the regular feature file will run a performance test and only excel with performance test report will be generated.
Make sure your tests are updated based on latest migration steps

mandatory parameters are : (duration_minutes or   max_loops,) and threads_number(also is a max thread number)
we can give both parameters duration_minutes and max_loops as well
max_loops will specify the maximum number of iterations of the flow to run
optional parameters are : evenly_increment_by, increment_by_thread_num, increment_every_num_seconds
Only set evenly_increment_by or increment_by_thread_num with increment_every_num_seconds
log_all_requests will log all passing request/response data as well
request_retry_attempts is available if you want to retry the request immediately if it fails.

Data driven tests can be ran as performance, the data from the data excel will be in the params_array before calling
custom function get_test_params_performance

custom function to generate data is available. You can provide test params for each tread
#This function can be used to provide data for performance test. Params will go into the test_params of each thread.
#thread number is given to genarate the params for each thread as needed.
# params be given as array of hashes. The length of the arrays = number of threads
def get_test_params_performance(params_array)
  params_array.each do |params|
    params['TEST_VALUE'] ||= rand(9999).to_s
  end
end

to get best results in performance test, do not use time consuming methods in setup, after, and validation steps
such as call to db or other API calls even though it's possible to do so

When running performance tests make sure you run on desktop or laptop connected to power which is sufficient to run CPU at 100%
If CPU is not able to reach 100% then the results of the test will not be accurate

move grath for thoughput to time over threads
possible to make throughput data more accurate
take the first requests with a num of threads, push into array untill the last
take the time of the first and the last request to get duration

install curl windows https://curl.haxx.se/gknw.net/7.40.0/