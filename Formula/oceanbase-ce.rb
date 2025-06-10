# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class OceanbaseCe < Formula
  desc "A wrapper to run oceanbase-ce using docker containers"
  homepage "https://github.com/chris-sun-star/oceanbase-ce"
  url "https://github.com/chris-sun-star/oceanbase-ce/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "d0bd24755bda21861fbf80241a6a002cff9b43d576f1c1c02b6f76eb87e91b45"
  license "Apache-2.0"

  depends_on "docker"
  def install
    bin.install "src/oceanbase-ce.sh" => "oceanbase-ce"
    # docker pull oceanbase/oceanbase-ce
    system "docker", "pull", "oceanbase-ce"
  end
end
