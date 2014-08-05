module Xio
  class Stream < Resource

    def self.create(params={}, options={})
      post("/streams", params, options)
    end

    def self.details(stream_id, options={})
      get("/streams/#{stream_id}", options)
    end

    def self.terminate(stream_id, options={})
      delete("/streams/#{stream_id}", nil, options)
    end

  end
end
