# LangchainRubySdk

Langchain API wrapper for Ruby. This supports only very specific use cases and operates as a tightly coupled client for a Flask app hosted on the hostari/hello-langchain repo.

## Installation

In your Gemfile add: 

    gem 'langchain_ruby_sdk'
    
Then run: 

    bundle install

## Usage

    client = LangchainRubySdk::Client.new('base_url', 'token')
    
To ask a question, input your text (e.g blog post/issue content or Newsletter Topic), prompt (your question), and return_source_documents (defaults to 0): 

    client.qa(text: 'text', prompt: 'prompt', return_source_documents: 0)

To generate a cold email using the ghostwriter, input your text (e.g blog post/issue content or Newsletter Topic), sales_rep (sender), prospect (recipient): 

    client.ghostwrite(text: 'text', sales_rep: 'Sales Rep', prospect: 'Prospect')

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
# langchain_ruby_sdk
