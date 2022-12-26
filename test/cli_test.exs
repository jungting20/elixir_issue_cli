defmodule CliTest do
  use ExUnit.Case
  doctest Issues
  import Issues.Cli, only: [parse_args: 1]

  test "-h or --helprk가 옵션으로 파싱되면 :help가 반환된다." do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "값을 3개 전달하면 값 3개가 반환된다" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end
end
