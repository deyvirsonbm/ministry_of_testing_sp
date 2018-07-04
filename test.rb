require "httparty"

class TestAPI
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com/'
end

RSpec.describe 'Using GET ' do

    it 'List all post'  do

        begin
            response = TestAPI.get('/posts');   
            expect(response.code).to eql(200)
        end
    end

    it 'List a specif post'  do

        begin
            response = TestAPI.get('/posts/1');
            expect(response.code).to eql(200)
            expect(response['title']).to eql('sunt aut facere repellat provident occaecati excepturi optio reprehenderit')
            expect(response['id']).to eql(1)
        end
    end

    it 'List a non existent post'  do

        begin
            response = TestAPI.get('/posts/101');
            expect(response.code).to eql(404)
        end
    end

    it 'List all comments from a specfic post' do
        begin
            response = TestAPI.get('/posts/1/comments');
            expect(response.code).to eql(200)
        end
    end

    it 'List a non existent comment'  do

        begin
            response = TestAPI.get('/posts/1/comments/501');
            expect(response.code).to eql(404)
        end
    end

    it 'List a specif comment'  do

        begin
            response = TestAPI.get('/comments?postId=1');
            expect(response.code).to eql(200)
            expect(response[0]['name']).to eql('id labore ex et quam laborum')
            expect(response[0]['email']).to eql('Eliseo@gardner.biz')
            expect(response[0]['id']).to eql(1)
        end
    end
end

RSpec.describe 'Using POST - ' do

  it 'Creating a resource'  do
    params = {
      "title" => "foo",
      "body" => "bar",
      "userId" => 1 
    }

    header = {
      "Content-Type" => "application/json; charset=UTF-8"
    }

    begin
      response = TestAPI.post('/posts', :body => params, :header => header );
      expect(response.code).to eql(201)
      expect(response['title']).to eql('foo')
      expect(response['body']).to eql('bar')
    end
  end
end


RSpec.describe 'Using PUT - ' do

  it 'Editing a resource'  do
    params = {
      "id" => 1,
      "title" => "A simple title",
      "body" => "A simple text to body" 
    }

    header = {
      "Content-Type" => "application/json; charset=UTF-8"
    }

    begin
      response = TestAPI.put('/posts/1', :body => params, :header => header );
      expect(response.code).to eql(200)
      expect(response['title']).to eql('A simple title')
      expect(response['body']).to eql('A simple text to body')
    end
  end
end

RSpec.describe 'Using DELETE - ' do

  it 'DELETE a resource'  do
  
    begin
      response = TestAPI.delete('/posts/1');
      expect(response.code).to eql(200)
    end
  end

  it 'DELETE a invalid Resource'  do
  
    begin
      response = TestAPI.delete('/posts/4000');
      expect(response.code).to eql(404)
    end
  end
end