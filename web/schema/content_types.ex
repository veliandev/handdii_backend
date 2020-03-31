defmodule HanddiiBackend.Schema.ContentTypes do
    use Absinthe.Schema.Notation

    object :location do
        field :address, :string
        field :longitude, :float
        field :latitude, :float
    end
end