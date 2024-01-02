defmodule AnonRouletteWeb.Router do
  use AnonRouletteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {AnonRouletteWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Homepage
  scope "/", AnonRouletteWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # API
  # Token unrequired
  scope "/api", AnonRouletteWeb do
    pipe_through :api

    post "/tokens", TokenController, :create
    post "/users", UserController, :create
    get "/categories", CategoriesController, :index
    get "/categories/:category_id", CategoriesController, :show
    get "/ethnicities", EthnicityController, :index
    get "/ethnicities/:ethnicity_id", EthnicityController, :show
  end

  # Token required
  scope "/api", AnonRouletteWeb do
    pipe_through :api
    pipe_through AnonRouletteWeb.AuthPipeline

    get "/tokens", TokenController, :index
    delete "/tokens", TokenController, :delete_all
    get "/tokens/me", TokenController, :show
    delete "/tokens/me", TokenController, :delete
    get "/tokens/:token_id", TokenController, :show
    delete "/tokens/:token_id", TokenController, :delete
    get "/users/me", UserController, :show
    get "/users/:user_id", UserController, :show
    delete "/users/:user_id", UserController, :delete
    patch "/users/:user_id", UserController, :update

    get "/friends", FriendController, :index
    get "/friends/:friend_id", FriendController, :show
    delete "/friends/:friend_id", FriendController, :delete

    get "/friend-requests", FriendRequestController, :index
    post "/friend-requests", FriendRequestController, :create
    get "/friend-requests/:friend_request_id", FriendRequestController, :show
    patch "/friend-requests/:friend_request_id", FriendRequestController, :update

    post "/reports", ReportController, :create
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:anon_roulette, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: AnonRouletteWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
