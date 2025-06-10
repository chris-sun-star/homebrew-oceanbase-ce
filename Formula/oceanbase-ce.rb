class OceanbaseCe < Formula
  desc "A wrapper to run oceanbase-ce using docker containers"
  homepage "https://github.com/chris-sun-star/oceanbase-ce"
  url "https://github.com/chris-sun-star/oceanbase-ce/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "5bbe48d0b94418ab55406245b6a37f4c9f92dd26c45251adbbf0da2aa90cb6a1"
  license "Apache-2.0"

  depends_on "docker"

  def install
    bin.install "src/oceanbase-ce.sh" => "oceanbase-ce"
    system "docker", "pull", "oceanbase-ce"
  end
end
