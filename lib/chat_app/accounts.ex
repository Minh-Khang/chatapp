defmodule ChatApp.Accounts do
  alias ChatApp.Repo
  alias ChatApp.Accounts.User

  def sign_in(email, password) do
    user = Repo.get_by(User, email: email)

    cond do
      user && Argon2.verify_pass(password, user.password_hash) ->
        {:ok, user}
      true ->
        {:error, :unathorized}
    end
  end

  def user_sign_in?(conn), do: !!current_user(conn)
  def sign_out(conn), do: Plug.Conn.configure_session(conn, drop: true)

  def current_user(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: Repo.get(User, user_id)
  end
end
