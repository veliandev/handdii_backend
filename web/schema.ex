defmodule HanddiiBackend.Schema do
    use Absinthe.Schema

    import_types HanddiiBackend.Schema.ContentTypes

    query do

        field :locations, list_of(:location) do
            resolve &Resolvers.Content.list_locations/3
        end

    end

end