require "httparty"

class TestAPI
  include HTTParty
  base_uri 'http://localhost:5000/'
end

RSpec.describe 'Using PUT - ' do

  it 'Editando um contato', :put1 => true  do
    params = {
        'name'          => 'Joao',
        'mobilephone'   => '9999999999',
        'homephone'     => '55555555'
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
    	'name'          => 'Maria'
      'mobilephone'   => '33333333333',
      'homephone'     => '123455'
    }

    header = {
      "Content-Type" => "application/json"
    }

    begin
        response = TestAPI.put('/contacts/5c3f60ba2b60334a76566efc', :body => params, :header => header );
        expect(response.code).to eql(204)
    end
  end
end
