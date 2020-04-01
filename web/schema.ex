defmodule HanddiiBackend.Schema do
    use Absinthe.Schema

    import_types Absinthe.Type.Custom

    import_types HanddiiBackend.Schema.ContentTypes

    query do

        field :location, list_of(:location) do
            arg :search, non_null(:string)
            resolve &HanddiiBackend.Resolvers.Content.list_locations/3
        end

    end

end
