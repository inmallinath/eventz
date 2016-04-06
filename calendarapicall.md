Working:
  {
        "summary" => "Ruby Tech Meetup",
    "description" => "Ruby Tehcnology Meetup at Vancouver",
       "location" => "1000 1500 W Georgia St, Vancouver, BC V6G 2Z6",
          "start" => {
        "dateTime" => "2016-05-22T09:00:00-07:00"
    },
            "end" => {
        "dateTime" => "2016-05-22T17:00:00-07:00"
    },
      "attendees" => [
        [0] {
            "email" => "inmallinath@hotmail.com"
        }
    ]
}

=================
{
        "summary" => "Ruby Tech Meetup",
    "description" => "Ruby Tehcnology Meetup at Vancouver",
       "location" => "1000 1500 W Georgia St, Vancouver, BC V6G 2Z6",
          "start" => {
        "dateTime" => "2016-05-22T09:00:00-07:00"
    },
            "end" => {
        "dateTime" => "2016-05-22T17:00:00-07:00"
    },
      "attendees" => [
        [0] {
            "email" => "inmallinath@hotmail.com"
        }
    ]
}

=================

{
        "summary" => "TEst me Event ONE",
    "description" => "ONE TWO ",
       "location" => "109 W Hastings St, Vancouver, BC, Canada V6B 1H4",
          "start" => {
        "dateTime" => "4:30 PM"
    },
            "end" => {
        "dateTime" => "5:30 PM"
    },
      "attendees" => [
        [0] {
            "email" => "inmallinath@hotmail.com"
        }
    ]
}


startdate = params[:event_on].to_datetime
starttime = params[:start].to_time
gstart = DateTime.new
gstart = startdate.change({hour: starttime.hour, min: starttime.min})
enddate = params[:event_on].to_datetime
endtime = params[:end].to_time
gend = DateTime.new
gend = enddate.change({hour: starttime.hour, min: starttime.min})

# @event = {
#   'summary' => 'Shanaya\'s Birthday in 2016',
#   'description' => 'My Daughter\'s birthday related activities.',
#   'location' => '800 Howard St., San Francisco, CA 94103',
#   'start' => { 'dateTime' => "2016-05-20T09:00:00-07:00" },
#   'end' => { 'dateTime' => "2016-05-20T17:00:00-07:00"},
#   'attendees' => [ { "email" =>'inmallinath@hotmail.com' } ] }
#
# client = Google::APIClient.new
#
# client.authorization.access_token = current_user.token
# service = client.discovered_api('calendar', 'v3')
# @set_event = client.execute(:api_method => service.events.insert,
#                     :parameters => {'calendarId' => current_user.email, 'sendNotifications' => true},
#                     :body => JSON.dump(@event),
#                     :headers => {'Content-Type' => 'application/json'})
