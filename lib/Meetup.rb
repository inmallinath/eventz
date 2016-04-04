# module TPEvents
  class Meetup
    include HTTParty
    base_uri 'https://api.meetup.com'
    default_params state: 'BC', country: 'ca', status: 'upcoming', page: 10

    def initialize(key)
      self.class.default_params key: key
    end

    def events(options = {})
      raise ArgumentError, 'You must search for something' if options[:query].blank?

      # construct the request params
      options[:query] = options[:query].inject({}) { |h, q| h[q[0].to_s] = q[1]; h }
      # puts options[:query]
      # make a request and return the items (NOTE: this doesn't handle errors at this point)
      # binding.pry
      self.class.get('/2/open_events', options)
    end
  end
# end
# https://api.meetup.com/2/open_events.json?city=Richmond&state=BC&country=ca&time=-1w,&amp;status=past&key=3767c6f6f19391672353016494e797a
# https://api.meetup.com/2/open_events?state=BC&country=Canada&status=upcoming&key=3767c6f6f19391672353016494e797a&City=Vancouver
