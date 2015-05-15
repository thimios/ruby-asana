### WARNING: This file is auto-generated by the asana-api-meta repo. Do not
### edit it manually.

module Asana
  module Resources
    # A _team_ is used to group related projects and people together within an
    # organization. Each project in an organization is associated with a team.
    class Team < Resource


      attr_reader :id

      attr_reader :name

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'teams'
        end

        # Returns the full record for a single team.
        #
        # id - [Id] Globally unique identifier for the team.
        #
        # options - [Hash] the request I/O options.
        def find_by_id(client, id, options: {})

          self.new(parse(client.get("/teams/#{id}", options: options)).first, client: client)
        end

        # Returns the compact records for all teams in the organization visible to
        # the authorized user.
        #
        # organization - [Id] Globally unique identifier for the workspace or organization.
        #
        # limit - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_organization(client, organization: required("organization"), limit: 20, options: {})
          params = { limit: limit }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/organizations/#{organization}/teams", params: params, options: options)), type: self, client: client)
        end
      end

      # Returns the compact records for all users that are members of the team.
      #
      # limit - [Integer] the number of records to fetch per page.
      # options - [Hash] the request I/O options.
      def users(limit: 20, options: {})
        params = { limit: limit }.reject { |_,v| v.nil? || Array(v).empty? }
        Collection.new(parse(client.get("/teams/#{id}/users", params: params, options: options)), type: User, client: client)
      end

    end
  end
end
