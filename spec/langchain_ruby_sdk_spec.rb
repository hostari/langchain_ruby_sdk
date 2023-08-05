# frozen_string_literal: true
require 'langchain_ruby_sdk'
require 'httparty'

RSpec.describe LangchainRubySdk do
  let(:langchain_ruby_sdk) { LangchainRubySdk::Client.new("https://test-url/qa", "test-token") }
  context 'given a blog post' do
    it 'returns an answer to a prompt about the blog post' do
      parsed_response = {"result"=>"\nThe topic is about the time period two months before Christmas."}
      mock_response = double(parsed_response, success?: true, parsed_response: parsed_response)
      allow(HTTParty).to receive(:post).and_return(mock_response)
    
      result = langchain_ruby_sdk.qa("Two months before Christmas", "What does this statement mean?", 0)
      expect(result).to eq(mock_response)
    end
  end

  let(:langchain_ruby_sdk) { LangchainRubySdk::Client.new("https://test-url/ghostwrite/email", "test-token") }
  context 'given a blog post' do
    it 'generates cold email content using information from the blog post' do
      parsed_response = {"result"=>"\nThis is a pitch."}
      mock_response = double(parsed_response, success?: true, parsed_response: parsed_response)
      allow(HTTParty).to receive(:post).and_return(mock_response)
    
      result = langchain_ruby_sdk.ghostwrite("some random content", "Kaori", "Sakura")
      expect(result).to eq(mock_response)
    end
  end
end
