require "httparty"

class TestAPI
  include HTTParty
  base_uri 'http://localhost:5000/'
end

RSpec.describe 'Using POST - ' do

  it 'Criando um novo contato', :post1 => true  do
    params = {
        'name'          => 'Xuxa',
        'mobilephone'   => '6666666666',
        'homephone'     => '123455'
    }

    header = {
      "Content-Type" => "application/json"
    }

    begin
        response = TestAPI.post('/contacts', :body => params, :header => header );
        expect(response.code).to eql(201)
    end
  end

	  it 'Criando um contato inválido'  do
	    params = {
	        'mobilephone'   => '666666666',
	        'homephone'     => '123455'
	    }

	    header = {
	      "Content-Type" => "application/json"
	    }

	    begin
	        response = TestAPI.post('/contacts', :body => params, :header => header );
	        expect(response.code).to eql(400)
	    end
	  end
end
