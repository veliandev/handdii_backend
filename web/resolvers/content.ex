defmodule HanddiiBackend.Resolvers.Content do

    # Todo; add in an argument for address so we can just pass that to the query.
    # Todo; return the description, longitude and latitude for each location we find.
    def list_locations(_parent, %{search: search}, _resolution) do

        baseUrl = "https://api.opencagedata.com/geocode/v1/json?"
        query = %{key: "ceb6a9aaca6c4da7ac181b5f6a726148", q: search, pretty: 1}

        HTTPoison.start

        response = HTTPoison.get!(baseUrl <> Plug.Conn.Query.encode(query))

        body = HTTPoison.Handlers.Multipart.decode_body(response)
        body = Poison.decode!(body)

        result = Enum.map(body["results"], fn (res) ->
            %{description: res["formatted"], longitude: res["geometry"]["lng"], latitude: res["geometry"]["lat"]}
        end)

        IO.inspect result
        IO.inspect to_string(is_list(result))
        {:ok, result}
    end

end
