require 'httparty'
require 'faker'
require 'json'

class TestAPI
  include HTTParty
  base_uri 'http://localhost:5000/'
end

RSpec.describe 'Using POST - ' do

  it 'Criando um novo contato', :post1 => true  do
    params = {
        'name'          => Faker::Name.name,
        'mobilephone'   => Faker::PhoneNumber.cell_phone,
        'homephone'     => Faker::PhoneNumber.phone_number
    }

    header = {
      "Content-Type" => "application/json"
    }

    begin
        response = TestAPI.post('/contacts', :body => params, :header => header );
        expect(response.code).to eql(201)
    end
  end

	  it 'Criando um contato inválido' , :post2 => true do
	    params = {
        'mobilephone'   => Faker::PhoneNumber.cell_phone,
        'homephone'     => Faker::PhoneNumber.phone_number
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
