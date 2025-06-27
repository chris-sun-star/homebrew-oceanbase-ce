class OceanbaseCe < Formula
  desc "A wrapper to run oceanbase-ce using docker containers"
  homepage "https://github.com/chris-sun-star/oceanbase-ce"
  url "https://github.com/chris-sun-star/oceanbase-ce/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "ac20bcd6c9dc593ea07287f78dec31241bca00c7b1914c22af7c9f95e5534e2e"
  license "Apache-2.0"

  def install
    ENV.prepend_path "PATH", "/usr/local/bin"
    bin.install "src/oceanbase-ce.sh" => "oceanbase-ce"
    system "docker", "pull", "oceanbase/oceanbase-ce"
  end

  def post_install
    chmod 0755, bin/'oceanbase-ce'
    puts "Permissions set to 0755 for #{bin/'oceanbase-ce'}"
  end

  def test
    ENV.prepend_path "PATH", "/usr/local/bin"
    system "oceanbase-ce", "-h"
  end

  def post_uninstall
    ENV.prepend_path "PATH", "/usr/local/bin"
    system "docker", "rm", "-f", "oceanbase-ce"
    system "rm", "-rf", "~/.oceanbase-ce/*"
  end
end
