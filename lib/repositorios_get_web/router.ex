defmodule RepositoriosGetWeb.Router do
  use RepositoriosGetWeb, :router

  pipeline :browser do
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug RepositoriosGetWeb.Auth.Pipeline
  end

  scope "/", RepositoriosGetWeb do
    pipe_through(:api)

    get("/", PageController, :index)

    post("/user", UserController, :create)

    post("/user/sign", UserController, :sign_in)
  end

  scope "/", RepositoriosGetWeb do
    pipe_through([:api, :auth])

    get("/client/:id", ClientController, :show)
  end

  # Other scopes may use custom stacks.
  # scope "/api", RepositoriosGetWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: RepositoriosGetWeb.Telemetry)
    end
  end
end
