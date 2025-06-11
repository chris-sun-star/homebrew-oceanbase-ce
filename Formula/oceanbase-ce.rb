class OceanbaseCe < Formula
  desc "A wrapper to run oceanbase-ce using docker containers"
  homepage "https://github.com/chris-sun-star/oceanbase-ce"
  url "https://github.com/chris-sun-star/oceanbase-ce/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "5bbe48d0b94418ab55406245b6a37f4c9f92dd26c45251adbbf0da2aa90cb6a1"
  license "Apache-2.0"

  def install
    unless system("which docker >/dev/null 2>&1")
      opoo "Docker is not installed or not in PATH. Please install Docker before proceeding."
      exit 1
    end

    bin.install "src/oceanbase-ce.sh" => "oceanbase-ce"
    system "docker", "pull", "oceanbase-ce"
  end

  def test
    system "oceanbase-ce", "-h"
  end
end
