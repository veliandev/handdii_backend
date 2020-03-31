defmodule HanddiiBackend.Resolvers.Content do

    # Todo; add in an argument for address so we can just pass that to the query.
    # Todo; return the description, longitude and latitude for each location we find.
    def list_locations(_parent, _args, _resolution) do
        # Call API endpoint here??

        baseUrl = "https://api.opencagedata.com/geocode/v1/json?"
        query = %{key: "ceb6a9aaca6c4da7ac181b5f6a726148", q: "42 little charles street", pretty: 1}

        HTTPoison.start

        result = HTTPoison.get!(baseUrl <> Plug.Conn.Query.encode(query))
        body = Jason.decode(result.body)

        # It's like a map of listed keyword list maps or something. I have no idea how to parse it. If I knew, I'd be done.
        IO.inspect body

        # Without the result.body content, there isn't much we can do here.
        {:ok, %HanddiiBackend.Models{name: "Location", description: "the name of the place in full", longitude: 0.5, latitude: 100.53}}
    end
    
end