class Contact

    def getSchema
        {
            "$schema": "http://json-schema.org/draft-04/schema#",
            "type": "array",
            "items": [
              {
                "type": "object",
                "properties": {
                  "_id": {
                    "type": "string"
                  },
                  "name": {
                    "type": "string"
                  },
                  "mobilephone": {
                    "type": "string"
                  },
                  "homephone": {
                    "type": "string"
                  }
                },
                "required": [
                  "_id",
                  "name",
                  "mobilephone",
                  "homephone"
                ]
              }
            ]
          }
    end

  end