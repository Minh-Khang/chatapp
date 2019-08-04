defmodule ChatAppWeb.Plugs.AuthUser do
	import Plug.Conn
	import Phoenix.Controller

	alias ChatAppWeb.Router.Helpers, as: Routes 

	def init(_params) do
		
	end

	def call(conn, _params) do
		if conn.assigns.signed_in? do
	      conn
	    else
	      conn
	      |> put_flash(:error, "You must be signed in")
	      |> redirect(to: Routes.session_path(conn, :new))
	      |> halt
	    end
	end
end