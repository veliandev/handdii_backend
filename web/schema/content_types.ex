defmodule HanddiiBackend.Schema.ContentTypes do
    use Absinthe.Schema.Notation

    object :location do
        field :description, :string
        field :longitude, :float
        field :latitude, :float
    end

end
