require 'httparty'
require 'faker'

class TestAPI
  include HTTParty
  base_uri 'http://localhost:5000/'
end

RSpec.describe 'Using PUT - ' do

  it 'Editando um contato', :put1 => true  do
    params = {
        'name'          => Faker::Name.name,
        'mobilephone'   => Faker::PhoneNumber.cell_phone,
        'homephone'     => Faker::PhoneNumber.phone_number
    }

    header = {
      "Content-Type" => "application/json"
    }

    begin
        response = TestAPI.put('/contacts/56d5efa8c82593800291c02b', :body => params, :header => header );
        expect(response.code).to eql(204)
    end
  end

  it 'Editando um contato inexistente', :put2 => true do
    params = {
    	'name'          => Faker::Name.name,
      'mobilephone'   => Faker::PhoneNumber.cell_phone,
      'homephone'     => Faker::PhoneNumber.phone_number
    }

    header = {
      "Content-Type" => "application/json"
    }

    begin
        response = TestAPI.put('/contacts/5c3f60ba2b60334a76566efc', :body => params, :header => header );
        expect(response.code).to eql(404)
    end
  end
end
