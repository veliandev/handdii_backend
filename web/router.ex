defmodule HanddiiBackend.Router do
  use HanddiiBackend.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: HanddiiBackend.Schema

    forward "/", Absinthe.Plug, schema: HanddiiBackend.Schema

  end

  scope "/", HanddiiBackend do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HanddiiBackend do
  #   pipe_through :api
  # end
end
