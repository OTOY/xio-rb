module Xio
  class Resource

    include Xio::Serializer

    def self.api_key_id
      Xio.api_key_id
    end

    def self.api_secret_key
      Xio.api_secret_key
    end

    def self.base_url
      Xio.base_url
    end

    def self.post(path, params={}, options={})
      options = options.dup
      url     = url_for(path, options)
      body    = encode(params)
      options = add_api_key_header(options)
      HTTP.post(url, body, options)
    end

    def self.put(path, params={}, options={})
      options = options.dup
      url     = url_for(path, options)
      body    = encode(params)
      options = add_api_key_header(options)
      HTTP.put(url, body, options)
    end

    def self.get(path, options={})
      options = options.dup
      url     = url_for(path, options)
      options = add_api_key_header(options)
      HTTP.get(url, options)
    end

    def self.delete(path, options={})
      options = options.dup
      url     = url_for(path)
      options = add_api_key_header(options)
      HTTP.delete(url, options)
    end


  protected

    def self.url_for(path, options={})
      File.join((options[:base_url] || base_url).to_s, path.to_s)
    end

    def self.add_api_key_header(options)
      if options[:headers]
        options[:headers] = options[:headers].dup
      else
        options[:headers] = {}
      end
      options[:headers]["XIO-API-Key-ID"] = api_key_id
      options[:headers]["XIO-API-Secret-Key"] = api_secret_key

      options
    end

    def self.merge_params(options, params)
      if options[:params]
        options[:params] = options[:params].merge(params)
        options
      else
        options.merge(:params => params)
      end
    end

  end
end
