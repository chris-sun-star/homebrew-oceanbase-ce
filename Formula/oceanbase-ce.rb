class OceanbaseCe < Formula
  desc "A wrapper to run oceanbase-ce using docker containers"
  homepage "https://github.com/chris-sun-star/oceanbase-ce"
  url "https://github.com/chris-sun-star/oceanbase-ce/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "ac20bcd6c9dc593ea07287f78dec31241bca00c7b1914c22af7c9f95e5534e2e"
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
