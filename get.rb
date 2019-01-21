require "httparty"

class TestAPI
  include HTTParty
  base_uri 'http://localhost:5000/'
end

RSpec.describe 'Usando Verbo GET ' do

    it 'Listar todos os contatos da agenda', :get1 => true  do
        begin
            response = TestAPI.get('/contacts'); 
            expect(response.code).to eql(200)
        end
    end
        
    it 'Listar um contato específico', :get2 => true do 
        begin 
            response = TestAPI.get('/contacts?mobilephone=0552188889999');
            expect(response.code).to eql(200)
        end
    end

    it 'Listar um contato inexistente', :get3 => true  do
        begin
            response = TestAPI.get('/contacts?name=wanderley');
            puts expect(response.code).to eql(404)
            puts expect(response.message).to eql("Not Found")
        end
    end
end