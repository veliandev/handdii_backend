defmodule HanddiiBackend.Resolvers.Content do

    def list_locations(_parent, _args, _resolution) do
        # Call API endpoint here??
        {:ok, ["Hello World", 2.50, 5.00]}
    end
    
end