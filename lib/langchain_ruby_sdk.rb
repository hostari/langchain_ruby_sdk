# frozen_string_literal: true

require_relative "langchain_ruby_sdk/version"
require "httparty"

module LangchainRubySdk
  class Client
    def initialize(base_url, token)
      @base_url = base_url
      @token = token
    end

    #HTTParty.post("https://hello-langchain-1944039657.fly.dev/qa", headers:{ 'Content-Type' => 'application/json' }, body: {token: token, text: "some text", prompt: some prompt", text_type: "html", return_source_documents:0}.to_json)
    def qa(text, prompt, return_source_documents)
      if return_source_documents
        return_source_documents_int = 1
      else
        return_source_documents_int = 0
      end

      body = {token: @token, text: text, prompt: prompt, text_type: set_text_type, return_source_documents: return_source_documents_int}.to_json
      response = HTTParty.post("#{@base_url}/qa", headers: set_headers, body: body)  
    end

    def ghostwrite(text, sales_rep, prospect)
      body = {token: @token, text: text, sales_rep: sales_rep, prospect: prospect, text_type: set_text_type}.to_json
      response = HTTParty.post("#{@base_url}/ghostwrite/email", headers: set_headers, body: body)
    end
    
    def set_headers
      { 'Content-Type' => 'application/json' }
    end

    def set_text_type
      "html"
    end
  end
end